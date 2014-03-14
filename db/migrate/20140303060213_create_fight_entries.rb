class CreateFightEntries < ActiveRecord::Migration
  def change
    create_table :fight_entries do |t|
      t.integer :fight_id, null: false
      t.integer :mech_id, null: false
      t.integer :result
      t.timestamps
    end
  end
end
