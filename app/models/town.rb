class Town < ApplicationRecord
  belongs_to :depart
  has_many :places, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name,:airport,:transpterminal, :depart_id, presence: {message: "Campo obligatorio"}
  validates :name,:weather,:demonym, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :avertemper, numericality: {only_float: true, :greater_than => -60.0, :less_than => 60.0 ,message: "Debe estar entre -60 y 60"}
  validates :altitude, numericality: {only_integer: true, :greater_than => 0, :less_than => 6000 ,message: "Debe estar entre 0 y 60000"}
end
