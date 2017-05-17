class Town < ApplicationRecord
  #default_scope {order("towns.created_at ASC")}
  scope :order_by_name, -> (type) {order("towns.name  #{type}")}

  belongs_to :depart
  has_many :places, :dependent => :destroy
  has_many :imagetowns, :dependent => :destroy
  has_many :commenttowns, :dependent => :destroy
  has_many :commentplaces, :dependent => :destroy

  validates :name,:airport,:transpterminal, :depart_id, presence: {message: "Campo obligatorio"}
  validates :name,:weather,:demonym, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :avertemper, numericality: {only_float: true, :greater_than => -60.0, :less_than => 60.0 ,message: "Debe estar entre -60 y 60"}
  validates :altitude, numericality: {only_integer: true, :greater_than => -1, :less_than => 6000 ,message: "Debe estar entre 0 y 60000"}

  def self.load_towns(page = 1, per_page = 10)
    includes(:imagetowns,:commenttowns,:places,depart:[:imagedeparts])
      .paginate(:page => page, :per_page => per_page)
  end

  def self.lawea(page = 1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    load_towns(page,per_page)
    .select(columns)
  end

  def self.towns_by_id(id,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    includes(:imagetowns,:commenttowns,:places,depart:[:imagedeparts])
    .select(columns)
      .find_by_id(id)
  end

  def self.towns_by_name(name,page = 1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    load_towns(page,per_page)
    .select(columns)
      .where("unaccent(lower(towns.name))  like ?", "%#{name.downcase}%")
  end

  def self.towns_by_airport(airport,page=1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    load_towns(page,per_page)
      .select(columns)
      .where('towns.airport = ?', airport)
  end

  def self.towns_by_transpterminal(transpterminal,page=1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    load_towns(page,per_page)
      .select(columns)
      .where('towns.transpterminal = ?', transpterminal)
  end

  def self.towns_by_depart(depart,page=1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    joins(:depart).select("towns.*,departs.id, towns.id")
      .select(columns)
        .where("towns.depart_id=?", depart)
          .includes(:imagetowns,:commenttowns,:places,depart:[:imagedeparts])
            .paginate(:page => page,:per_page => per_page)
  end

  def self.towns_by_avertemper(avertemper,page=1, per_page = 10,columns)
    columns=columns ? columns+",depart_id" : "towns.*,depart_id"
    load_towns(page,per_page)
      .select(columns)
        .where("towns.avertemper = ?", avertemper)
  end
end
