class Depart < ApplicationRecord
  default_scope {order("departs.created_at ASC")}
  scope :order_by_name, -> (type) {order("departs.name  #{type}")}

  has_many :towns, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :name,:capital,:demonym, presence: {message: "Campo obligatorio"}
  validates :name,:capital, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
  validates :demonym, uniqueness: {message: "Ya esta registrado"}
  validates :name,:capital,:demonym, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}

  def self.load_departs(page = 1, per_page = 10)
    includes(:images,:towns)
      .paginate(:page => page, :per_page => per_page)
  end

  def self.departs_by_id(id)
    includes(:images,:towns)
      .find_by_id(id)
  end

  def self.departs_by_name(name,page = 1, per_page = 10)
    load_departs(page,per_page)
      .where("departs.name = ?", name)
  end

end
