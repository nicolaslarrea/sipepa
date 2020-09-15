class Conocido < ApplicationRecord
  belongs_to :user
  belongs_to :votante

  validates :user, uniqueness: { scope: :votante }
end
