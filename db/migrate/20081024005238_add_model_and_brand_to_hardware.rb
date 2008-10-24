class AddModelAndBrandToHardware < ActiveRecord::Migration
  def self.up
    add_column :hardwares, :brand, :string
    add_column :hardwares, :model, :string
  end

  def self.down
    remove_column :hardwares, :brand
    remove_column :hardwares, :model
  end
end
