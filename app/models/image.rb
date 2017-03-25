class Image < ApplicationRecord
  belongs_to :depart
  belongs_to :town
  belongs_to :place
end
