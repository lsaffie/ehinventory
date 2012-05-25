class Document < ActiveRecord::Base
  has_many :tickets
  has_many :attachments

  accepts_nested_attributes_for :attachments, :allow_destroy => true
  
  def self.search(search, page)
      find(:all,
           :conditions => ['title LIKE ? or body LIKE ?', "%#{search}%", "%#{search}%"],
           :order => 'updated_at DESC, created_at DESC')
  end
end
