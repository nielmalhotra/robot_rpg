class AddFightUserIdToFightMechs < ActiveRecord::Migration
  def change
    add_column :fight_mechs, :fight_user_id, :integer, null: false
  end
end
