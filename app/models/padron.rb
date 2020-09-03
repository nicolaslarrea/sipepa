class Padron < ApplicationRecord
  has_and_belongs_to_many :votantes

  validates :ano, presence: true, uniqueness: true
end
