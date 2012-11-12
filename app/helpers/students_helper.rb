module StudentsHelper

  def show_assessment(student,assessment)
    if current_user.admin?
      raw("#{link_to assessment.name, edit_student_assessment_path(@student,assessment)} Grade: #{assessment.grade}  on #{assessment.assessed_at.to_s(:medium)} #{button_to('Delete', student_assessment_path(@student, assessment), :class => 'btn-warning', :method => :delete, :confirm => "Are you sure you want to delete this assessment?")}")
    else
      raw("#{link_to assessment.name, edit_student_assessment_path(@student,assessment)} Grade: #{assessment.grade} on #{assessment.assessed_at.to_s(:medium)}")
    end
  end
end
