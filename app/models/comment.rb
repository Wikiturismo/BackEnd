class Comment < ApplicationRecord
  belongs_to :town
  belongs_to :place
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :publicationdate, :user_id, presence: {message: "Campo obligatorio"}

end
