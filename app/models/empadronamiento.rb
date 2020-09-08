class Empadronamiento < ApplicationRecord
  belongs_to :eleccion
  belongs_to :votante

  validates :votante_id, uniqueness: { scope: :eleccion_id }
end
