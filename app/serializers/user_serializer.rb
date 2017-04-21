class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :kind, :mail, :ubication

  has_many :commentplaces
  has_many :commenttowns
  has_many :places
end
