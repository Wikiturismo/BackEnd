class TownSerializer < ActiveModel::Serializer
  attributes :id, :name, :airport, :transpterminal, :weather, :demonym, :avertemper, :altitude

  #belongs_to :depart
end
