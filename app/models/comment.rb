class Comment < ApplicationRecord

  belongs_to :town
  belongs_to :place
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :publicationdate, :user_id, presence: {message: "Campo obligatorio"}

  def self.load_comments(page = 1, per_page = 10)
    includes(place:[:images,:schedules],town:[:places,:images],user:[:places])
    .paginate(:page => page, :per_page => per_page)
  end

  def self.comments_by_id(id)
    includes(place:[:images,:schedules],town:[:places,:images],user:[:places])
    .find_by_id(id)
  end

  def self.comments_by_state(state,page = 1, per_page = 10)
    load_comments(page,per_page)
    .where("comments.state = ?", state)
  end
  def self.comments_by_publicationdate(page = 1, per_page = 10)
    load_comments(page,per_page)
    .where("comments.publicationdate < ?", Date.today)
  end

  def self.comments_by_town(town,page = 1, per_page = 10)
    joins(:town).select("comments.*,towns.id")
        .where("towns.name = ? AND comments.town_id=towns.id", town)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_place(place,page = 1, per_page = 10)
    joins(:place).select("comments.*, places.id")
        .where("places.name = ? AND comments.place_id=places.id", place)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_user(user,page = 1, per_page = 10)
    joins(:user).select("comments.*, users.id")
        .where("users.name = ? AND comments.user_id=users.id", user)
            .paginate(:page => page,:per_page => per_page)
  end
end
