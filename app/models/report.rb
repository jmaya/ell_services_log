require 'csv'
class Report < ActiveRecord::Base
  attr_accessible :name, :sql
  validates_presence_of :name
  validates_presence_of :sql
  validates_uniqueness_of :name
  validates_uniqueness_of :sql

  def run
    headers = false
    csv = ''
    connection.execute(sql).collect do |r|
      unless headers
        csv << CSV.generate_line(r.keys)
        headers = true
      end
      csv << CSV.generate_line(r.values)
    end
    csv
  end

  def file_name
    "#{self.name.underscore.gsub(/\s/,"_")}.csv"
  end
end
