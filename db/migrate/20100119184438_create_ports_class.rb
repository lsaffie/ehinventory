class CreatePortsClass < ActiveRecord::Migration
  def self.up
    create_table :ports do |t|
      t.string :patch1
      t.string :patch2
      t.string :patch3
      t.string :patch4
      t.string :patch5
      t.string :patch6
      t.text :description
      t.integer :room_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ports
  end
end
