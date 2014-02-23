class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false
      t.string :subject
      t.string :body
      t.boolean :read, null: false, default: false
      t.timestamps
    end
  end
end
