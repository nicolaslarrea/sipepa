class AddUserToVotantes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votantes, :user, index: {:unique=>true}, null: true, foreign_key: true
  end
end
