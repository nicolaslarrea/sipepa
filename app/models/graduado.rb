class Graduado < ApplicationRecord
  has_many :empadronamientos, dependent: :destroy
  belongs_to :user, required: false

  validates :documento, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :titulo, presence: true
  validates :user, allow_nil: true, uniqueness: true
end
