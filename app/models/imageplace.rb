class Imageplace < ApplicationRecord


  belongs_to :place

  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  
  def self.load_imageplaces(page = 1, per_page = 10)
        includes(place:[:commentplaces,:schedules])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.imageplaces_by_id(id)
    includes(place:[:commentplaces,:schedules])
    .find_by_id(id)
  end

  def self.imageplaces_by_place(name,page, per_page = 10)
      joins(:place).select("imageplaces.*, places.id,imageplaces.id")
          .where("lower(places.name) = ? AND imageplaces.place_id=places.id", name.downcase)
            .includes(place:[:commentplaces,:schedules])
                  .paginate(:page => page,:per_page => per_page)
  end
  mount_uploader :image, ImageplacesUploader
end
