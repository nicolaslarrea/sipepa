class Eleccion < ApplicationRecord
  has_many :empadronamientos

  validates :ano, presence: true, uniqueness: true
end
