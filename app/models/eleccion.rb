class Eleccion < ApplicationRecord
  has_many :empadronamientos, dependent: :destroy

  validates :ano, presence: true, uniqueness: true
end
