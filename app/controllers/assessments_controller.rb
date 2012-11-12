class AssessmentsController < ApplicationController
  before_filter :get_student

  def search
    @assessments = Assessment.where("name like ? ", "%#{params[:term].upcase}%").collect {|c| c.name }.uniq
    respond_to do |format|
      format.json { render json: @assessments}
    end
  end
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
    begin
    @student ||= Student.find params[:student_id]
    rescue
      Student.new
    end
  end
end
