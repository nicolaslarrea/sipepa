class CreatePadrones < ActiveRecord::Migration[6.0]
  def change
    create_table :padrones do |t|
      t.string :ano, null: false, unique: true

      t.timestamps
    end
  end
end
