class AssignmentsController < ApplicationController
  before_filter :login_required
  def destroy
    @assignment = Assignment.find(params[:id])
    @hardware = @assignment.hardware
    Assignment.delete(@assignment)

    redirect_to request.env["HTTP_REFERER"]
  end
end
