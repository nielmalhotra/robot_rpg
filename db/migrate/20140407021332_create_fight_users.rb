class CreateFightUsers < ActiveRecord::Migration
  def change
    create_table :fight_users do |t|
      t.integer :fight_id, null: false
      t.integer :user_id, null: false
      t.integer :result
      t.timestamps
    end
  end
end
