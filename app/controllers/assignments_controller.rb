class AssignmentsController < ApplicationController
  before_filter :login_required
  def destroy
    @assignment = Assignment.find(params[:id])
    @hardware = @assignment.hardware
    Assignment.delete(@assignment)
    
    respond_to do |format|
      format.html { redirect_to request.env["HTTP_REFERER"] }
      format.js do
        render :update do |page|
          page.remove "assignment_#{@assignment.id}"
        end
      end
    end

  end
end
