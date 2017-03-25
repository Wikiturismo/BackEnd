class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  
  validates :height, :width,:depart_id,:town_id, presence: {message: "Campo obligatorio"}
  validates :height, numericality: {only_integer: true, :greater_than => 100,message: "Debe ser mayor a 100"}
  validates :width, numericality: {only_integer: true, :greater_than => 100,message: "Debe ser mayor a 100"}
end
