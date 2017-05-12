class Commenttown < ApplicationRecord

  belongs_to :town
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :user_id, presence: {message: "Campo obligatorio"}


  def self.load_commenttowns(page = 1, per_page = 10)
    includes(town:[:places,:imagetowns],user:[:places])
    .paginate(:page => page, :per_page => per_page)
  end

  def self.commenttowns_by_id(id,columns)
    columns=columns ? columns+", town_id, user_id" : "commenttowns.*, town_id, user_id"
    includes(town:[:places,:imagetowns],user:[:places])
    .select(columns)
    .find_by_id(id)
  end

  def self.lawea(page = 1, per_page = 10,columns)
    columns=columns ? columns+", town_id, user_id" : "commenttowns.*, town_id, user_id"
    load_commenttowns(page,per_page)
    .select(columns)
  end

  def self.commenttowns_by_state(state,page=1, per_page = 10, columns)
    columns=columns ? columns+", town_id, user_id" : "commenttowns.*, town_id, user_id"
    load_commenttowns(page,per_page)
    .select(columns)
    .where("commenttowns.state = ?", state)
  end

  def self.commenttowns_by_publicationdate(page=1, per_page = 10, columns)
    columns=columns ? columns+", town_id, user_id" : "commenttowns.*, town_id, user_id"
    load_commenttowns(page,per_page)
    .select(columns)
    .where("commenttowns.created_at < ?", Date.today)
    .where(state:1)
  end

  def self.commenttowns_by_town(town,page=1, per_page = 10,columns)
    columns=columns ? columns+", town_id" : "commenttowns.*, town_id"
    joins(:town).select("commenttowns.*,towns.id,commenttowns.id")
      .select(columns)
        .where("lower(towns.name) = ? AND commenttowns.town_id=towns.id", town.downcase)
        .includes(town:[:places,:imagetowns],user:[:places])
        .where(state:1)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commenttowns_by_depart(depart,page=1, per_page = 10, columns)
    columns=columns ? columns+", depart_id" : "commenttowns.*, depart_id"
    joins(:depart).select("commenttowns.*, departs.id,commenttowns.id")
      .select(columns)
        .where("lower(departs.name) = ? AND commenttowns.depart_id=departs.id", depart.downcase)
        .where(state:1)
        .includes(town:[:places,:imagetowns],user:[:places], state:1)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commenttowns_by_user(user,page=1, per_page = 10, columns)
    columns=columns ? columns+", user_id" : "commenttowns.*, user_id"
    joins(:user).select("commenttowns.*, users.id,commenttowns.id")
      .select(columns)
        .where("lower(users.name) = ? AND commenttowns.user_id=users.id", user.downcase)
        .where(state:1)
          .includes(town:[:places,:imagetowns],user:[:places], state:1)
            .paginate(:page => page,:per_page => per_page)
  end
end
