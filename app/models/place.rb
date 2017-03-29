class Place < ApplicationRecord

    default_scope {order("places.created_at ASC")}
    scope :order_by_name, -> (type) {order("places.name  #{type}")}


    belongs_to :town
    belongs_to :depart
    belongs_to :user
    has_many :images, as: :imageable, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :schedules, dependent: :destroy

    validates :name,:state,:publicationdate,:description, :ubication, :address, :type, :depart_id, :town_id, :user_id, presence: true
    validates :name,:ubication,:address, :type, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
    validates :valoration, numericality: {only_integer: true, :greater_than => 0, :less_than => 50 ,message: "Debe estar entre 0 y 50"}
    validates :entrycost, numericality: {only_integer: true, :greater_than => 0,message: "Debe ser mayor a 0"}

    def self.load_places(page = 1, per_page = 10)
        includes(:images,town:[:comments,:images],:comments,user:[:comments],:depart:[:images,:town])
        .paginate(:page => page, :per_page => per_page)
    end

    def self.places_by_id(id)
        includes(:images,town:[:comments,:images],:comments,user:[:comments],:depart:[:images,:town])
       .find_by_id(id)
    end

    def self.places_by_name(name,page = 1, per_page = 10)
        load_places(page,per_page)
        .where("places.name LIKE ?", "#{name.downcase}")
    end

    def self.places_by_valoration(valoration,page = 1, per_page = 10)
        load_places(page,per_page)
        .where("places.valoration = ?", valoration)
    end

    def self.places_by_entrycost(entrycost,page = 1, per_page = 10)
        load_places(page,per_page)
        .where("places.entrycost = ?", entrycost)
    end

    def self.places_by_publicationdate(page = 1, per_page = 10)
        load_places(page,per_page)
        .where("places.publicationdate < ?", Date.today)
    end

    def self.places_by_type(type,page = 1, per_page = 10)
        load_places(page,per_page)
        .where("places.type LIKE ?", "#{type.downcase}")
    end

    def self.places_by_depart(name,page = 1, per_page = 10)
        joins(:departs)
            .where("departs.name LIKE ? AND places.depart_id=depart.id", "#{name.downcase}")
                .select("place. *")
                    .paginate(:page => page,:per_page => per_page)
    end

    def self.places_by_town(name,page = 1, per_page = 10)
        joins(:towns)
            .where("towns.name LIKE ? AND places.town_id=town.id", "#{name.downcase}")
                .select("place. *")
                .paginate(:page => page,:per_page => per_page)
    end

end
