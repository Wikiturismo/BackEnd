class ImagetownSerializer < ActiveModel::Serializer
  attributes :id, :height, :width

  belongs_to :town
end
