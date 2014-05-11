class SetHpOnMechNotFightMech < ActiveRecord::Migration
  def up
    remove_column :fight_mechs, :current_armor
    add_column :mechs, :current_armor, :integer, default: 50
  end

  def down
    add_column :fight_mechs, :current_armor, :integer, default: 50
    remove_column :mechs, :current_armor
  end
end
