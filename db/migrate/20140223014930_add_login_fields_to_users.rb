class AddLoginFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email

      # authlogic fields
      t.string :crypted_password, null: false
      t.string :password_salt, null: false
      t.string :persistence_token, null: false

      t.timestamps
    end
  end
end
