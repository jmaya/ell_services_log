class Category < ActiveRecord::Base
  attr_accessible :description, :name, :order_number
  validates_presence_of :name
  has_many :tasks
end
