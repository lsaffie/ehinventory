class Hardware < ActiveRecord::Base
  has_many :tickets
  has_many :assignments
  has_many :softwares, :through => :assignments
  belongs_to :hardware_type
  belongs_to :owner
  
  def self.search(search,type)
    if search
      find(:all, :conditions => ['serial_number LIKE ?', "%#{search}%"])
    elsif type
      find(:all, :conditions => ['hardware_type_id LIKE ?', "%#{type}"])
    else
      find(:all)
    end
  end
  
end
