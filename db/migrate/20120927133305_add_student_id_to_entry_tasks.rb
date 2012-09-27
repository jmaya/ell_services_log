class AddStudentIdToEntryTasks < ActiveRecord::Migration
  def change
    add_column :entry_tasks, :student_id, :integer
  end
end
