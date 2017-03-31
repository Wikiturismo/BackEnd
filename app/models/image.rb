class Image < ApplicationRecord

  belongs_to :depart
  belongs_to :town
  belongs_to :place

  validates :height, :width, :path, presence: {message: "Campo obligatorio"}
  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :height, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}

  def self.load_images(page = 1, per_page = 10)
        includes(town:[:comments,:places],place:[:comments,:schedules],depart:[:towns])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.images_by_id(id)
    includes(town:[:comments,:places],place:[:comments,:schedules],depart:[:towns])
    .find_by_id(id)
  end


  def self.images_by_depart(name,page = 1, per_page = 10)
        joins(:depart).select("images.id, departs.*")
            .where("departs.name = ? AND images.depart_id=departs.id", name)
                .group("images.id, departs.id")
                    .paginate(:page => page,:per_page => per_page)
    end
    def self.images_by_town(name,page = 1, per_page = 10)
        joins(:town).select("images.id, towns.*")
            .where("towns.name = ? AND images.town_id=towns.id", name)
                .group("images.id, towns.id")
                    .paginate(:page => page,:per_page => per_page)
    end
    def self.images_by_place(name,page = 1, per_page = 10)
        joins(:place).select("images.id, places.*")
            .where("places.name = ? AND images.place_id=places.id", name)
                .group("images.id, places.id")
                    .paginate(:page => page,:per_page => per_page)
    end
end
