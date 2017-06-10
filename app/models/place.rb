class Place < ApplicationRecord
    #default_scope {order("places.created_at ASC")}
    scope :order_by_name, -> (type) {order("places.name  #{type}")}
    scope :top, -> {order("places.valoration DESC").where(state:1).limit(10)}
    scope :recent, ->{order("places.created_at DESC").where(state:1).limit(3)}
    scope :random, ->{Place.order("RANDOM()").where(state: 1).limit(10)}

    belongs_to :town
    belongs_to :depart
    belongs_to :user
    has_many :commentplaces,  :dependent => :destroy
    has_many :schedules, :dependent => :destroy
    has_many :imageplaces, :dependent => :destroy
    has_many :commentplaces, :dependent => :destroy

    validates :name,:state,:description, :ubication, :address, :kind, :depart_id, :town_id, :user_id, presence: true
    validates :name,:ubication,:address, :kind, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
    validates :valoration, numericality: {only_float: true, :greater_than => -1.0, :less_than => 6.0 ,message: "Debe estar entre 0 y 5"}
    validates :entrycost, numericality: {only_integer: true, :greater_than => -1,message: "Debe ser mayor a 0"}

    def self.load_places(page = 1, per_page = 10)
        includes(:imageplaces,:commentplaces,user:[:commentplaces,:commenttowns],depart:[:imagedeparts,:towns],town:[:commenttowns,:imagetowns])
        .paginate(:page => page, :per_page => per_page)
    end

    def self.places_by_id(id, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        includes(:imageplaces,:commentplaces,user:[:commentplaces,:commenttowns],depart:[:imagedeparts,:towns],town:[:commenttowns,:imagetowns])
        .select(columns)
       .find_by_id(id)
    end

    def self.places_by_random_id(page = 1 , per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
      random_ids = Array.new(11) {rand(Town.count)}
      load_places(page,per_page)
      .select(columns)
      .where(id: random_ids, state:1)
    end

    def self.places_by_name(name,page = 1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        load_places(page,per_page)
        .select(columns)
        .where("lower(places.name) = ?", name.downcase)
    end

    def self.places_by_valoration(valoration,page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        load_places(page,per_page)
        .select(columns)
        .where("places.valoration = ?", valoration )
        .where(state:1)
    end

    def self.places_by_entrycost(entrycost,page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        load_places(page,per_page)
        .select(columns)
        .where("places.entrycost = ?", entrycost)
        .where(state:1)
    end

    def self.places_by_publicationdate(page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        load_places(page,per_page)
        .select(columns)
        .where("places.created_at < ?", Date.today)
        .where(state:1)
    end

    def self.places_by_kind(kind,page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        load_places(page,per_page)
        .select(columns)
        .where("lower(places.kind) = ?", kind.downcase)
        .where(state:1)
    end

    def self.places_by_depart(name,page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, depart_id, town_id" : "places.*, user_id, depart_id, town_id"
        joins(:depart).select("places.*, departs.id,places.id")
        .select(columns)
            .where("lower(departs.name) = ? AND places.depart_id=departs.id", name.downcase)
              .where(state:1)
                    .paginate(:page => page,:per_page => per_page)
    end

    def self.places_by_town(name,page=1, per_page = 10, columns)
      columns=columns ? columns+", user_id, town_id" : "places.*, user_id, town_id"
        joins(:town).select("places.*, towns.id,places.id")
          .select(columns)
            .where("lower(towns.name) = ? AND places.town_id=towns.id", name.downcase)
            .where(state:1)
                .paginate(:page => page,:per_page => per_page)
    end

end
