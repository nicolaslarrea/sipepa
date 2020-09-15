class Votante < ApplicationRecord
  has_many :empadronamientos
  belongs_to :user, required: false

  validates :documento, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :titulo, presence: true
  validates :user, uniqueness: true
end
