class DepartSerializer < ActiveModel::Serializer
  attributes :id, :name, :capital, :demonym
  has_many :towns
  has_many :imagedeparts
end
