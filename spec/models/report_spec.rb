require 'spec_helper'

describe Report do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}
  it { should validate_presence_of :sql }
  it { should validate_uniqueness_of :sql}

  it "convert_to_csv" do
    student = FactoryGirl.create(:student)
    report = Report.new(:name => "Student", :sql => "SELECT * FROM students")
    d = report.run
    d.should match(/LastName1,1,1,2012-10-30/)
  end
end
