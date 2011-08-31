class Software < ActiveRecord::Base
  has_many :tickets
  has_many :assignments
  has_many :hardwares, :through => :assignments

  validates_presence_of :name
  validates_presence_of :owner

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"], 
           :order => "created_at DESC")
    else
      find(:all, :order => "updated_at DESC, created_at DESC")
    end
  end
end
