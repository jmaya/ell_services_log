class AssessmentsController < ApplicationController
  before_filter :get_student
  def new
    @assessment = @student.assessments.build
  end

  def create
    assessment = @student.assessments.create(params[:assessment])
    respond_to do |format|
      if assessment
        format.html { redirect_to @student, @notice => 'Assessment Created' }
      end
    end
  end

  def get_student
    @student ||= Student.find params[:student_id]
  end
end
