class AddUserToGraduados < ActiveRecord::Migration[6.0]
  def change
    add_reference :graduados, :user, index: {:unique=>true}, null: true, foreign_key: true
  end
end
