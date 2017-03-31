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
    joins(:town).select("comments.id,towns.*")
        .where("towns.name = ? AND comments.town_id=towns.id", town)
          .group("comments.id, towns.id")
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_place(place,page = 1, per_page = 10)
    joins(:place).select("comments.id, places.*")
        .where("places.name = ? AND comments.place_id=places.id", place)
          .group("comments.id, places.id")
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_user(user,page = 1, per_page = 10)
    joins(:user).select("comments.id, users.*")
        .where("users.name = ? AND comments.user_id=users.id", user)
          .group("comments.id, users.id")
            .paginate(:page => page,:per_page => per_page)
  end
end
