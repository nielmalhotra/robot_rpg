class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.timestamp :start_time, null: false
      t.integer :result
      t.timestamps
    end
  end
end
