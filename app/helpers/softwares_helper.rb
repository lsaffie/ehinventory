module SoftwaresHelper
  def print_owner(assignment)
    Hardware.find(assignment.hardware_id).owner.name
  end
end
