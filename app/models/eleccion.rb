class Eleccion < ApplicationRecord
  validates :ano, presence: true, uniqueness: true
end
