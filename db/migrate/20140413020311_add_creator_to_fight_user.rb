class AddCreatorToFightUser < ActiveRecord::Migration
  def change
    add_column :fight_users, :creator, :boolean, null: false, default: false
  end
end
