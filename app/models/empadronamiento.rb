class Empadronamiento < ApplicationRecord
  belongs_to :eleccion
  belongs_to :graduado

  validates :graduado_id, uniqueness: { scope: :eleccion_id }
end
