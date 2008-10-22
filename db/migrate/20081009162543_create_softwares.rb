class CreateSoftwares < ActiveRecord::Migration
  def self.up
    create_table :softwares do |t|
      t.string :name
      t.string :owner
      t.string :license_key
      t.string :number_of_licenses
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :softwares
  end
end
