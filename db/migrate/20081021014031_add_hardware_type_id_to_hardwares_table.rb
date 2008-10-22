class AddHardwareTypeIdToHardwaresTable < ActiveRecord::Migration
  def self.up
    add_column :hardwares, :hardware_type_id, :integer
  end

  def self.down
    remove_column :hardwares, :hardware_type_id
  end
end
