class Schedule < ApplicationRecord
  belongs_to :place

  validates :place_id, presence: {message: "Campo obligatorio"}
end
