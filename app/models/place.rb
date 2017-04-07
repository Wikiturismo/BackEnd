class Place < ApplicationRecord
    #default_scope {order("places.created_at ASC")}
    scope :order_by_name, -> (type) {order("places.name  #{type}")}
    scope :top, -> {order("places.valoration DESC").limit(10)}
    scope :recent, ->{order("places.created_at DESC").limit(3)}

    belongs_to :town
    belongs_to :depart
    belongs_to :user
    has_many :commentplaces,  :dependent => :destroy
    has_many :schedules, :dependent => :destroy
    has_many :imageplaces, :dependent => :destroy
    has_many :commentplaces, :dependent => :destroy

    validates :name,:state,:publicationdate,:description, :ubication, :address, :kind, :depart_id, :town_id, :user_id, presence: true
    validates :name,:ubication,:address, :kind, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
    validates :valoration, numericality: {only_integer: true, :greater_than => -1, :less_than => 50 ,message: "Debe estar entre 0 y 50"}
    validates :entrycost, numericality: {only_integer: true, :greater_than => -1,message: "Debe ser mayor a 0"}

    def self.load_places(page = 1, per_page = 10)
        includes(:imageplaces,:commentplaces,user:[:commentplaces,:commenttowns],depart:[:imagedeparts,:towns],town:[:commenttowns,:imagetowns])
        .paginate(:page => page, :per_page => per_page)
    end

    def self.places_by_id(id)
        includes(:imageplaces,:commentplaces,user:[:commentplaces,:commenttowns],depart:[:imagedeparts,:towns],town:[:commenttowns,:imagetowns])
       .find_by_id(id)
    end

    def self.places_by_name(name,page = 1, per_page = 10)
        load_places(page,per_page)
        .where("lower(places.name) = ?", name.downcase)
    end

    def self.places_by_valoration(valoration,page, per_page = 10)
        load_places(page,per_page)
        .where("places.valoration = ?", valoration)
    end

    def self.places_by_entrycost(entrycost,page, per_page = 10)
        load_places(page,per_page)
        .where("places.entrycost = ?", entrycost)
    end

    def self.places_by_publicationdate(page, per_page = 10)
        load_places(page,per_page)
        .where("places.publicationdate < ?", Date.today)
    end

    def self.places_by_kind(kind,page, per_page = 10)
        load_places(page,per_page)
        .where("lower(places.kind) = ?", kind.downcase)
    end

    def self.places_by_depart(name,page, per_page = 10)
        joins(:depart).select("places.*, departs.id,places.id")
            .where("lower(departs.name) = ? AND places.depart_id=departs.id", name.downcase)
                    .paginate(:page => page,:per_page => per_page)
    end

    def self.places_by_town(name,page, per_page = 10)
        joins(:town).select("places.*, towns.id,places.id")
            .where("lower(towns.name) = ? AND places.town_id=towns.id", name.downcase)
                .paginate(:page => page,:per_page => per_page)
    end

end
