class Place < ApplicationRecord
  belongs_to :town
  belongs_to :depart
  belongs_to :user
end
