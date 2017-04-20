class CommenttownSerializer < ActiveModel::Serializer
  attributes :id,:content, :state

  #belongs_to :town
  #belongs_to :user
  #belongs_to :depart
end
