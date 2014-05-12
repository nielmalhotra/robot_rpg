class AddCurrentTurnUserIdToFights < ActiveRecord::Migration
  def change
    add_column :fights, :current_turn_user_id, :integer
  end
end
