class Report < ActiveRecord::Base
  attr_accessible :name, :sql
  validates_presence_of :name
  validates_presence_of :sql
  validates_uniqueness_of :name
  validates_uniqueness_of :sql

  def run
    connection.execute(sql).collect do |r|
      r.values
    end
  end
end
