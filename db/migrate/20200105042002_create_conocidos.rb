class CreateConocidos < ActiveRecord::Migration[6.0]
  def change
    create_table :conocidos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :graduado, null: false, foreign_key: true

      t.timestamps
    end
    add_index :conocidos, [:user_id, :graduado_id], unique: true
  end
end
