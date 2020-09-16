class CreateEmpadronamientos < ActiveRecord::Migration[6.0]
  def change
    create_table :empadronamientos do |t|
      t.references :eleccion, null: false, foreign_key: true
      t.references :graduado, null: false, foreign_key: true

      t.timestamps
    end

    add_index :empadronamientos, [ :eleccion_id, :graduado_id ], unique: true
  end
end
