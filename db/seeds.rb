# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'category'
require 'task'
YAML.load_file(Rails.root + "db/categories.yaml").each do |c|
  attr = c.attributes
  attr.delete("id")
  attr.delete("created_at")
  attr.delete("updated_at")
  Category.create!(attr)
end
YAML.load_file(Rails.root + "db/tasks.yaml").each do |c|
  attr = c.attributes
  attr.delete("id")
  attr.delete("created_at")
  attr.delete("updated_at")
  Task.create!(attr)
end
