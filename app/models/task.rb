class Task < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :category
  attr_accessible :category_id, :name

  has_many :entries, :through => :entry_tasks
  has_many :entry_tasks
end
