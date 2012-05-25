class CreateAttachmentsTable < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string  :file_file_name
      t.string  :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.references :document
    end
  end

  def self.down
    drop_table :attachments
  end
end
