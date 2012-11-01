require 'csv'
require 'digest/sha1'
class Report < ActiveRecord::Base
  attr_accessible :name, :sql
  attr_reader :checksum
  validates_presence_of :name
  validates_presence_of :sql
  validates_uniqueness_of :name
  validates_uniqueness_of :sql

  before_save :generate_checksum


  def run
    new_checksum = Digest::SHA1.hexdigest sql
    raise "SQL Tampered" unless @checksum == new_checksum
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

  private
  def generate_checksum
    @checksum = Digest::SHA1.hexdigest sql
  end
end
