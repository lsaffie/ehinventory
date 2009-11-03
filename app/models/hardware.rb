class Hardware < ActiveRecord::Base
  has_many :tickets
  has_many :assignments
  has_many :softwares, :through => :assignments
  belongs_to :hardware_type
  belongs_to :owner
  
  validates_presence_of :serial_number
  validates_presence_of :owner_id

  
  def self.search(search,type)
    if search
      find(:all, :conditions => ['serial_number LIKE ?', "%#{search}%"], :order => "hardware_type_id, serial_number" )
    elsif type
      find(:all, :conditions => ['hardware_type_id LIKE ?', "%#{type}"], :order => "hardware_type_id, serial_number" )
    else
      find(:all, :order => "hardware_type_id, serial_number")
    end
  end
  
end
