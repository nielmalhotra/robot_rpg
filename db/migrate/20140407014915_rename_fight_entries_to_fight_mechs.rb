class RenameFightEntriesToFightMechs < ActiveRecord::Migration
  def change
    rename_table :fight_entries, :fight_mechs
  end
end
