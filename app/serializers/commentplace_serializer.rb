class CommentplaceSerializer < ActiveModel::Serializer
  attributes :id, :content, :state

  #belongs_to :town
  #belongs_to :place
  #belongs_to :user
  #belongs_to :depart
end
