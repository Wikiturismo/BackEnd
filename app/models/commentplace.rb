class Commentplace < ApplicationRecord

  belongs_to :town
  belongs_to :place
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :user_id, presence: {message: "Campo obligatorio"}

  def self.load_commentplaces(page = 1, per_page = 10)
    includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
    .paginate(:page => page, :per_page => per_page)
  end

  def self.lawea(page = 1, per_page = 10,columns)
    columns=columns ? columns+", place_id, town_id, user_id" : "commentplaces.*, place_id, town_id, user_id"
    load_commentplaces(page,per_page)
    .select(columns)
  end

  def self.commentplaces_by_id(id,columns)
    columns=columns ? columns+", place_id, town_id, user_id" : "commentplaces.*, place_id, town_id, user_id"
    includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
    .select(columns)
    .find_by_id(id)
  end

  def self.commentplaces_by_state(state,page=1, per_page = 10, columns)
    columns=columns ? columns+", place_id, town_id, user_id" : "commentplaces.*, place_id, town_id, user_id"
    load_commentplaces(page,per_page)
    .select(columns)
    .where("commentplaces.state = ?", state)
  end

  def self.commentplaces_by_publicationdate(page, per_page = 10, columns)
    columns=columns ? columns+", place_id, town_id, user_id" : "commentplaces.*, place_id, town_id, user_id"
    load_commentplaces(page,per_page)
    .select(columns)
    .where("commentplaces.created_at < ?", Date.today, state: 1)
  end

  def self.commentplaces_by_place(place,page =1 , per_page = 10, columns)
    columns=columns ? columns+", place_id" : "commentplaces.*, place_id"
    joins(:place).select("commentplaces.*, places.id,commentplaces.id")
      .select(columns)
        .where("lower(places.name) = ? AND commentplaces.place_id=places.id", place.downcase)
        .where(state:1)
        .includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
            .paginate(:page => page,:per_page => per_page)
  end
  def self.commentplaces_by_town(town,page=1 , per_page = 10, columns)
    columns=columns ? columns+", town_id" : "commentplaces.*, town_id"
    joins(:town).select("commentplaces.*, towns.id,commentplaces.id")
      .select(columns)
        .where("lower(towns.name) = ? AND commentplaces.town_id=towns.id", town.downcase)
        .where(state:1)
        .includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commentplaces_by_depart(depart,page=1, per_page = 10, columns)
    columns=columns ? columns+", depart_id" : "commentplaces.*, depart_id"
    joins(:depart).select("commentplaces.*, departs.id,commentplaces.id")
      .select(columns)
        .where("lower(departs.name) = ? AND commentplaces.depart_id=departs.id", depart.downcase)
        .where(state:1)
        .includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commentplaces_by_user(user,page, per_page = 10, columns)
    columns=columns ? columns+", user_id" : "commentplaces.*, user_id"
    joins(:user).select("commentplaces.*, users.id,commentplaces.id")
      .select(columns)
        .where("lower(users.name) = ? AND commentplaces.user_id=users.id", user.downcase)
        .where(state:1)
        .includes(place:[:imageplaces,:schedules],town:[:places,:imagetowns],user:[:places])
            .paginate(:page => page,:per_page => per_page)
  end
end
