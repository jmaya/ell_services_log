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

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])

    respond_to do |format|
      if @assessment.update_attributes(params[:assessment])
        format.html { redirect_to @student, notice: 'Assessment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assessment = @student.assessments.find(params[:id])
    @assessment.destroy

    respond_to do |format|
      format.html { redirect_to @student, notice: 'Assessment was succsffully removed'}
      format.json { head :no_content }
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
