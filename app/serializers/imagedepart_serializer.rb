class ImagedepartSerializer < ActiveModel::Serializer
  attributes :id, :height, :width

  belongs_to :depart
end
