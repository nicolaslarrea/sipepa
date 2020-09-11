class Votante < ApplicationRecord
  has_many :empadronamientos
  belongs_to :user

  validates :documento, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :titulo, presence: true
end
