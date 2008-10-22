class Assignment < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :software
  
  def self.request(hardware,software)
    create(:hardware => hardware, :software => software)
  end
  
  def self.breakup(hardware,software)
    destroy(hardware,software)
  end
end
