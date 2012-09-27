class EntryTask < ActiveRecord::Base
  attr_accessible :entry_id, :task_id, :student_id
  belongs_to :entry
  belongs_to :task
  belongs_to :student
end
