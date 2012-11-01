require 'csv'
require 'digest/sha1'
class Report < ActiveRecord::Base
  attr_accessible :name, :sql
  attr_reader :checksum
  validates_presence_of :name
  validates_presence_of :sql
  validates_uniqueness_of :name
  validates_uniqueness_of :sql

  before_save :save_generated_checksum


  def run
    new_checksum = generate_checksum(sql)
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

  def save_generated_checksum
    @checksum = generate_checksum(sql)
  end

  def generate_checksum(data)
    Digest::SHA1.hexdigest(data)
  end
end
