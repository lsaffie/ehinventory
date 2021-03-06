class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.integer :hardware_id
      t.integer :software_id
      t.integer :document_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
