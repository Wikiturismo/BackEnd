class ImageuserSerializer < ActiveModel::Serializer
  attributes :id, :height, :width

  #belongs_to :user
end
