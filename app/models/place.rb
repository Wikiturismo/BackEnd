class Place < ApplicationRecord
  belongs_to :town
  belongs_to :depart
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
