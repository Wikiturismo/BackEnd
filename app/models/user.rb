class User < ApplicationRecord
  has_many :comments
  has_many :places

  validates :name,:type,:mail,:registdate, presence: { message: "Campo obligatorio"}
  validates :name, uniqueness: {case_sensitive: true ,message: "Ya esta registrado"}
  validates :mail, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
  validates :name, length: { in: 3..50, message: "debe tener entre 3 y 50 caracteres"}
  validates :mail, length: { in: 12..60, message: "debe tener entre 12 y 60 caracteres"}
  validates :type, length: { maximum: 20, message: "debe tener maximo 20 caracteres"}
  validates :ubication, length: { in: 5..80, message: "debe tener entre 5 y 80 caracteres"}
end
