class Student < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :groups
  attr_accessible :first_name, :language_classification, :last_name, :level, :number, :group_list
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :number
end
