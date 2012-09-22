class EntryTask < ActiveRecord::Base
  attr_accessible :entry_id, :task_id
  belongs_to :entry
  belongs_to :task
end
