require 'factory_girl'

FactoryGirl.define do
  factory :student do
    sequence(:first_name) {|n| "FirstName#{n}"}
    sequence(:last_name) {|n| "LastName#{n}"}
    sequence(:number) {|n| "#{n}"}
    sequence(:level) {|n| "#{n}"}
    sequence(:language_classification) {|n| "#{n}"}
    sequence(:sex) {|n| "M"}
    sequence(:birthdate) {|n| Time.now }
  end
end
