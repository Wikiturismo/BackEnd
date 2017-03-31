class User < ApplicationRecord
  default_scope {order("users.created_at ASC")}
  scope :order_by_name, -> (type) {order("users.name  #{type}")}
  has_many :comments
  has_many :places

  validates :name,:kind,:mail,:registdate, presence: { message: "Campo obligatorio"}
  validates :name, uniqueness: {case_sensitive: true ,message: "Ya esta registrado"}
  validates :mail, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
  validates :name, length: { in: 3..50, message: "debe tener entre 3 y 50 caracteres"}
  validates :mail, length: { in: 12..60, message: "debe tener entre 12 y 60 caracteres"}
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :kind, length: { maximum: 20, message: "debe tener maximo 20 caracteres"}
  validates :ubication, length: { in: 5..80, message: "debe tener entre 5 y 80 caracteres"}
  def self.load_users(page = 1, per_page = 10)
        includes(:comments,:places)
        .paginate(:page => page, :per_page => per_page)
    end
    def self.users_by_id(id)
        includes(:comments,:places)
       .find_by_id(id)
    end
    def self.users_by_name(name,page = 1, per_page = 10)
        load_users(page,per_page)
        .where("lower(users.name) = ?", name.downcase)
    end
    def self.users_by_mail(mail,page = 1, per_page = 10)
        load_users(page,per_page)
        .where("lower(users.mail) = ?", mail.downcase)
    end
    def self.users_by_kind(kind,page = 1, per_page = 10)
        load_users(page,per_page)
        .where("lower(users.kind) = ?", kind.downcase)
    end
end
