class Document < ActiveRecord::Base
  has_many :tickets
  
  ## Paperclip implementation
  # has_attached_file :file
  
    
  def self.search(search, page)
      paginate :per_page => 10, :page => page,
               :conditions => ['title LIKE ? or body LIKE ?', "%#{search}%", "%#{search}%"],
               :order => 'title'
  end
end
