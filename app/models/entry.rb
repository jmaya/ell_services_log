class Entry < ActiveRecord::Base
  attr_accessible :date_of_service, :duration_of_service, :group_size, :task_ids
  has_many :tasks, :through => :entry_tasks
  has_many :entry_tasks
  accepts_nested_attributes_for :tasks
end
