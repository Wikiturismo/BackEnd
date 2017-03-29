class Place < ApplicationRecord
  belongs_to :town
  belongs_to :depart
  belongs_to :user
  has_many :images, as: :imageable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name,:state,:publicationdate,:description, :ubication, :address, :type, :depart_id, :town_id, :user_id, presence: true
  validates :name,:ubication,:address, :type, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
  validates :valoration, numericality: {only_integer: true, :greater_than => 0, :less_than => 50 ,message: "Debe estar entre 0 y 50"}
  validates :entrycost, numericality: {only_integer: true, :greater_than => 0,message: "Debe ser mayor a 0"}

  def self.load_places(page = 1, per_page = 10)
    includes(:images,:towns,:comments:users:schedules)
    .paginate(:page => page, :per_page => per_page)
  end

  def self.places_by_id(id)
    includes(:images,:towns,:comments:users:schedules)
    .find_by_id(id)
  end

  def self.places_by_name(name,page = 1, per_page = 10)
    load_dplaces(page,per_page)
    .where("places.name LIKE ?", "#{name.downcase}")
  end

  def self.places_by_schedule(schedule,page = 1, per_page = 10)
    load_dplaces(page,per_page)
    .where("places.name LIKE ?", "#{name.downcase}")
  end






end
