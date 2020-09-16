class CreateGraduados < ActiveRecord::Migration[6.0]
  def change
    create_table :graduados do |t|
      t.string :documento, null: false
      t.string :nombre,  null: false
      t.string :titulo, null: false

      t.timestamps
    end

    add_index :graduados, :documento, unique: true
  end
end
