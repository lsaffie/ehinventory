class Document < ActiveRecord::Base
  has_many :tickets
  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? or body LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
