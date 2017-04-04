class Commenttown < ApplicationRecord

  belongs_to :town
  belongs_to :user
  belongs_to :depart

  validates :content, :state, :publicationdate, :user_id, presence: {message: "Campo obligatorio"}

  def self.load_commenttowns(page = 1, per_page = 10)
    includes(town:[:places,:imagetowns],user:[:places])
    .paginate(:page => page, :per_page => per_page)
  end

  def self.commenttowns_by_id(id)
    includes(town:[:places,:imagetowns],user:[:places])
    .find_by_id(id)
  end

  def self.commenttowns_by_state(state,page = 1, per_page = 10)
    load_commenttowns(page,per_page)
    .where("commenttowns.state = ?", state)
  end
  def self.commenttowns_by_publicationdate(page = 1, per_page = 10)
    load_commenttowns(page,per_page)
    .where("commenttowns.publicationdate < ?", Date.today)
  end

  def self.commenttowns_by_town(town,page = 1, per_page = 10)
    joins(:town).select("commenttowns.*,towns.id,commenttowns.id")
        .where("lower(towns.name) = ? AND commenttowns.town_id=towns.id", town.downcase)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commenttowns_by_depart(depart,page = 1, per_page = 10)
    joins(:depart).select("commenttowns.*, departs.id,commenttowns.id")
        .where("lower(departs.name) = ? AND commenttowns.depart_id=departs.id", depart.downcase)
            .paginate(:page => page,:per_page => per_page)
  end

  def self.commenttowns_by_user(user,page = 1, per_page = 10)
    joins(:user).select("commenttowns.*, users.id,commenttowns.id")
        .where("lower(users.name) = ? AND commenttowns.user_id=users.id", user.downcase)
            .paginate(:page => page,:per_page => per_page)
  end
end
