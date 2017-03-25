class Depart < ApplicationRecord
    has_many :towns, dependent: :destroy
end
