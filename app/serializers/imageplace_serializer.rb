class ImageplaceSerializer < ActiveModel::Serializer
  attributes :id, :height, :width

  belongs_to :place
end
