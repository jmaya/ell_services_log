class Entry < ActiveRecord::Base
  attr_accessible :date_of_service, :duration_of_service, :group_size, :task_ids, :user_id,:student_ids
  has_many :tasks, :through => :entry_tasks
  has_many :students, :through => :entry_tasks
  has_many :entry_tasks
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :students
  validates_presence_of :date_of_service
  validates_presence_of :duration_of_service
  validates_presence_of :group_size
  belongs_to :user
end
