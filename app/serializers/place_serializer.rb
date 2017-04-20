class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name,:state,:description, :ubication, :address, :kind, :valoration, :entrycost

  #belongs_to :town
  #belongs_to :depart
  #belongs_to :user
  has_many :commentplaces
  has_many :schedules
  has_many :imageplaces
end
