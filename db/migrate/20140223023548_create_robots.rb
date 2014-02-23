class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :name
      t.integer :num_slots, default: 3
      t.timestamps
    end
  end
end
