class ImageuserSerializer < ActiveModel::Serializer
  attributes :id, :path

  #belongs_to :user
end
