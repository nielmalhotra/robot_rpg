class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.boolean :read
      t.string :type
      t.string :data

      t.timestamps
    end
  end
end
