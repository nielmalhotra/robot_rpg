class AddCurrentArmorToFightMech < ActiveRecord::Migration
  def change
    add_column :fight_mechs, :current_armor, :integer, default: 50
  end
end
