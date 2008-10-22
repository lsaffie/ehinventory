class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.string :name
      t.datetime :created_at
      t.integer :group_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
