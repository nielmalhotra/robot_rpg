class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :robot_id
      t.timestamps
    end
  end
end
