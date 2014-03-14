class CreateFightLogs < ActiveRecord::Migration
  def change
    create_table :fight_logs do |t|
      t.integer :fight_id, null: false
      t.integer :sequence, null: false
      t.string :message, null: false
      t.timestamps
    end
  end
end
