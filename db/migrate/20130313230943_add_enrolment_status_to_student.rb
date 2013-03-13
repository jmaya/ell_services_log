class AddEnrolmentStatusToStudent < ActiveRecord::Migration
  def change
    add_column :students, :enrolment_status, :boolean, :default => true
  end
end
