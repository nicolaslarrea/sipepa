class CreateEmpadronamientos < ActiveRecord::Migration[6.0]
  def change
    create_table :empadronamientos do |t|
      t.references :eleccion, null: false, foreign_key: true
      t.references :votante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
