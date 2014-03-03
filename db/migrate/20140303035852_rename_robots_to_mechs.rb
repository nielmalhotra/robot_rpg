class RenameRobotsToMechs < ActiveRecord::Migration
  def change
    rename_table :robots, :mechs
  end
end
