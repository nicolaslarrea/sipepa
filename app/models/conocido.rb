class Conocido < ApplicationRecord
  belongs_to :user
  belongs_to :graduado

  validates :user, uniqueness: { scope: :graduado }
end
