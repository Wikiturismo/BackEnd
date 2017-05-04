class User < ApplicationRecord
  default_scope {order("users.created_at ASC")}
  scope :order_by_name, -> (type) {order("users.name  #{type}")}
  has_many :commentplaces
  has_many :commenttowns
  has_many :places

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :name,:kind,:email, presence: { message: "Campo obligatorio"}
  validates :name, uniqueness: {case_sensitive: true ,message: "Ya esta registrado"}
  validates :email, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
  validates :name, length: { in: 3..50, message: "debe tener entre 3 y 50 caracteres"}
  validates :email, length: { in: 12..60, message: "debe tener entre 12 y 60 caracteres"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :kind, length: { maximum: 20, message: "debe tener maximo 20 caracteres"}
  validates :ubication, length: { in: 5..80, message: "debe tener entre 5 y 80 caracteres"}

  def self.load_users(page = 1, per_page = 10)
    includes(:commentplaces,:commenttowns,:places)
    .paginate(:page => page, :per_page => per_page)
  end

  def self.users_by_id(id,columns)
    columns=columns ? columns : "users.*"
    includes(:commentplaces,:commenttowns,:places)
    .select(columns)
    .find_by_id(id)
  end

  def self.users_by_name(name,page = 1, per_page = 10, columns)
    columns=columns ? columns+", commentplace_id, commenttown_id, place_id" : "users.*"
    load_users(page,per_page)
    .select(columns)
    .where("lower(users.name) = ?", name.downcase)
  end

  def self.users_by_mail(email,page = 1, per_page = 10, columns)
    columns=columns ? columns+", commentplace_id, commenttown_id, place_id" : "users.*, commentplace_id, commenttown_id, place_id"
    load_users(page,per_page)
    .select(columns)
    .where("lower(users.email) = ?", email.downcase)
  end

  def self.users_by_kind(kind,page=1, per_page = 10, columns)
    columns=columns ? columns+", commentplace_id, commenttown_id, place_id" : "users.*, commentplace_id, commenttown_id, place_id"
    load_users(page,per_page)
    .select(columns)
    .where("lower(users.kind) = ?", kind.downcase)
  end
end
