class TownSerializer < ActiveModel::Serializer
  attributes :id, :name, :airport, :transpterminal, :weather, :demonym, :avertemper, :altitude
  has_many :places
  has_many :imagetowns
  has_many :commenttowns
  #belongs_to :depart
end
