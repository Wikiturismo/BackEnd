class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :kind, :mail, :ubication, :registdate

  has_many :commentplaces
  has_many :commenttowns
  has_many :places
end
