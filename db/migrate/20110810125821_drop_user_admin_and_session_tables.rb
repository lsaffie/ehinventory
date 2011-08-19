class DropUserAdminAndSessionTables < ActiveRecord::Migration
  def self.up
    drop_table :users
    drop_table :admins
  end

  def self.down
  end
end
