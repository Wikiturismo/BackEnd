class Imagedepart < ApplicationRecord

  belongs_to :depart

  validates :height, :width, :path, presence: {message: "Campo obligatorio"}
  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :height, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}

  def self.load_imagedeparts(page = 1, per_page = 10)
        includes(depart:[:towns])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.imagedeparts_by_id(id)
    includes(depart:[:towns])
    .find_by_id(id)
  end

  def self.imagedeparts_by_depart(name,page, per_page = 10)
        joins(:depart).select("imagedeparts.*, departs.id,imagedeparts.id")
            .where("lower(departs.name) = ? AND imagedeparts.depart_id=departs.id", name.downcase)
              .includes(depart:[:towns])
                    .paginate(:page => page,:per_page => per_page)
    end
      mount_uploader :image, ImagedepartsUploader 
end
