class CreateElecciones < ActiveRecord::Migration[6.0]
  def change
    create_table :elecciones do |t|
      t.string :ano, null: false, unique: true

      t.timestamps
    end
  end
end
