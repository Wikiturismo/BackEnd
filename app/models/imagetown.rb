class Imagetown < ApplicationRecord

  attr_accessor :gallery_id, :name, :imagen
  belongs_to :gallery
  mount_uploader :imagen, ImagenUploader

  belongs_to :town

  validates :height, :width, :path, presence: {message: "Campo obligatorio"}
  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :height, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}

  def self.load_imagetowns(page = 1, per_page = 10)
        includes(town:[:commenttowns])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.imagetowns_by_id(id)
    includes(town:[:commenttowns])
    .find_by_id(id)
  end

  def self.imagetowns_by_town(name,page = 1, per_page = 10)
      joins(:town).select("imagetowns.*, towns.id,imagetowns.id")
          .where("lower(towns.name) = ? AND imagetowns.town_id=towns.id", name.downcase)
                  .paginate(:page => page,:per_page => per_page)
  end

end
