class Assessment < ActiveRecord::Base
  belongs_to :student
  attr_accessible :grade, :name, :assessed_at
end
