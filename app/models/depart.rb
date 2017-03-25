class Depart < ApplicationRecord
  has_many :towns, dependent: :destroy

  validates :name,:capital,:demonym, presence: {message: "Campo obligatorio"}
  validates :name,:capital, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
  validates :demonym, uniqueness: {message: "Ya esta registrado"}
  validates :name,:capital,:demonym, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}
end
