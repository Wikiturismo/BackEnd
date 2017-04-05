class TownSerializer < ActiveModel::Serializer
  attributes :id, :airport, :transpterminal, :weather, :demonym, :avertemper, :altitude

  #belongs_to :depart
end
