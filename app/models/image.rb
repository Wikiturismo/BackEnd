class Image < ApplicationRecord
  default_scope {order("comments.created_at ASC")}

  belongs_to :depart
  belongs_to :town
  belongs_to :place

  validates :height, :width, :path presence: {message: "Campo obligatorio"}
  validates :height, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 99,message: "Debe ser mayor a 100"}

  def self.load_images(page = 1, per_page = 10)
        includes(town:[:comments,:places],place:[:comments,:schedules],depart:[:images,:towns])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.images_by_id(id)
    includes(town:[:comments,:places],place:[:comments,:schedules],depart:[:images,:towns])
    .find_by_id(id)
  end


  def self.images_by_depart(depart,page = 1, per_page = 10)
        load_images(page,per_page)
        .where("images.depart_id LIKE ?", "#{depart.downcase}")
    end

  def self.images_by_town(town,page = 1, per_page = 10)
        load_images(page,per_page)
        .where("images.towns LIKE ?", "#{town.downcase}")
    end
  def self.images_by_place(place,page = 1, per_page = 10)
        load_images(page,per_page)
        .where("place.departs LIKE ?", "#{depart.downcase}")
    end
end
