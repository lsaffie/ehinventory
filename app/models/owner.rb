class Owner < ActiveRecord::Base
  has_many :hardwares
  belongs_to :group
end
