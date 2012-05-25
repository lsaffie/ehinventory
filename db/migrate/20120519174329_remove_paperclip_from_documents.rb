class RemovePaperclipFromDocuments < ActiveRecord::Migration
  def self.up
    remove_column :documents, :file_file_name
    remove_column :documents, :file_content_type
    remove_column :documents, :file_file_size
    remove_column :documents, :file_updated_at
  end

end
