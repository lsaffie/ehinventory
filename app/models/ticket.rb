class Ticket < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :software
  belongs_to :document
end
