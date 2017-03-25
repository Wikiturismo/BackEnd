class Place < ApplicationRecord
  belongs_to :town
  belongs_to :depart
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name,:state,:publicationdate,:description, :ubication, :address, :type, :depart_id, :town_id, :user_id, presence: true
  validates :name,:ubication,:address, :type, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :valoration, numericality: {only_integer: true, :greater_than => 0, :less_than => 50 ,message: "Debe estar entre 0 y 50"}
  validates :entrycost, numericality: {only_integer: true, :greater_than => 0,message: "Debe ser mayor a 0"}
end
