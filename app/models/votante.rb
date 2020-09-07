class Votante < ApplicationRecord

  validates :documento, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :titulo, presence: true
end
