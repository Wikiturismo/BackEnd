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
    joins(:towns)
        .where("towns.name LIKE ? AND comments.town_id=town.id", "#{town.downcase}")
          .select("comments. *")
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_place(place,page = 1, per_page = 10)
    joins(:places)
        .where("places.name LIKE ? AND comments.place_id=place.id", "#{place.downcase}")
          .select("comments. *")
            .paginate(:page => page,:per_page => per_page)
  end

  def self.comments_by_user(user,page = 1, per_page = 10)
    joins(:users)
        .where("users.name LIKE ? AND comments.user_id=user.id", "#{user.downcase}")
          .select("comments. *")
            .paginate(:page => page,:per_page => per_page)
  end
end
