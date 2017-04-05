class Commentplace < ApplicationRecord

  belongs_to :town
  belongs_to :place
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :publicationdate, :user_id, presence: {message: "Campo obligatorio"}

  def self.load_commentplaces(page = 1, per_page = 10)
    includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
    .paginate(:page => page, :per_page => per_page)
  end

  def self.commentplaces_by_id(id)
    includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
    .find_by_id(id)
  end

  def self.commentplaces_by_state(state,page = 1, per_page = 10)
    load_commentplaces(page,per_page)
    .where("comments.state = ?", state)
  end
  def self.commentplaces_by_publicationdate(page = 1, per_page = 10)
    load_commentplaces(page,per_page)
    .where("commentplaces.publicationdate < ?", Date.today)
  end

  def self.commentplaces_by_place(place,page = 1, per_page = 10)
    joins(:place).select("commentplaces.*, places.id,commentplaces.id")
        .where("lower(places.name) = ? AND commentplaces.place_id=places.id", place.downcase)
            .paginate(:page => page,:per_page => per_page)
  end
  def self.commentplaces_by_town(town,page = 1, per_page = 10)
    joins(:town).select("commentplaces.*, towns.id,commentplaces.id")
        .where("lower(towns.name) = ? AND commentplaces.place_id=places.id", town.downcase)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commentplaces_by_depart(depart,page = 1, per_page = 10)
    joins(:depart).select("commentplaces.*, departs.id,commentplaces.id")
        .where("lower(departs.name) = ? AND commentplaces.depart_id=departs.id", depart.downcase)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commentplaces_by_user(user,page = 1, per_page = 10)
    joins(:user).select("commentplaces.*, users.id,commentplaces.id")
        .where("lower(users.name) = ? AND commentplaces.user_id=users.id", user.downcase)
            .paginate(:page => page,:per_page => per_page)
  end
end
