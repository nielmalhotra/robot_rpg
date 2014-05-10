class AddDefaultToEventsRead < ActiveRecord::Migration
  def up
    change_column :events, :read, :boolean, default: false
  end

  def down
    change_column :events, :read, :boolean, default: nil
  end
end
