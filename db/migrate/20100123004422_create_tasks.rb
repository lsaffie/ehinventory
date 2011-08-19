class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
     t.string :task_name
     t.boolean :completed, :default => 0

     t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
