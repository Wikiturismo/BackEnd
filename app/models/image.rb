class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :place, -> { where( images: { :imageable_type: 'place' } ).includes( :images ) }, foreign_key: ':imageable_id'
  belongs_to :depart, -> { where( images: { :imageable_type: 'depart' } ).includes( :images ) }, foreign_key: ':imageable_id'
  belongs_to :town, -> { where( images: { :imageable_type: 'town' } ).includes( :images ) }, foreign_key: ':imageable_id'
  validates :height, :width,:depart_id,:town_id, presence: {message: "Campo obligatorio"}
  validates :height, numericality: {only_integer: true, :greater_than => 100,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 100,message: "Debe ser mayor a 100"}
  
  scope :departs, -> { 
    includes( :departs)
    .where( :departs => { featured: true } ) 
  }
  scope :towns, -> { 
    includes( :towns)
    .where( :towns => { featured: true } ) 
  }
  scope :places, -> { 
    includes( :places)
    .where( :places => { featured: true } ) 
  }
  
  
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
        .where("images.departs LIKE ?", "#{depart.downcase}")
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
