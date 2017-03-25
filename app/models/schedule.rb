class Schedule < ApplicationRecord
  belongs_to :place

  validates :user_id, presence: {message: "Campo obligatorio"}
end
