class Software < ActiveRecord::Base
  has_many :tickets
  has_many :assignments
  has_many :hardwares, :through => :assignments
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
