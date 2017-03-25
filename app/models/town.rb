class Town < ApplicationRecord
  belongs_to :depart
  has_many :places, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
end
