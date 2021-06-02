class Graduado < ApplicationRecord
  include PgSearch::Model

  has_many :empadronamientos, dependent: :destroy
  belongs_to :user, required: false

  validates :documento, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :titulo, presence: true
  validates :user, allow_nil: true, uniqueness: true

  pg_search_scope :buscar_por_documento_o_nombre, :against => [:documento, :nombre],
    using: {
      :tsearch => {:prefix => true}
    }
end
