class Eleccion < ApplicationRecord
  has_many :empadronamientos, dependent: :destroy
  has_many :graduados, through: :empadronamientos

  validates :ano, presence: true, uniqueness: true
end
