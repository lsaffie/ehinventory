class Software < ActiveRecord::Base
  has_many :tickets
  has_many :assignments
  has_many :hardwares, :through => :assignments

  validates_presence_of :name
  validates_presence_of :owner
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"], 
           :order => "updated_at DESC")
    else
      find(:all, :order => "owner, name")
    end
  end
end
