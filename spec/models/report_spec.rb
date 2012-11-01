require 'spec_helper'

describe Report do
  it { should validate_presence_of :name }
  # it { should validate_uniqueness_of :name}
  it { should validate_presence_of :sql }
  it { should validate_uniqueness_of :sql}

  xit "convert_to_csv" do
    student = FactoryGirl.create(:student)
    report = Report.new(:name => "Student", :sql => "SELECT * FROM students")
    d = report.run
    d.should match(/LastName1,1,1,2012-10-30/)
  end

  it "should generate a name" do
    r = Report.new(:name => "A weird name 1", :sql => "SELECT * FROM students")
    r.file_name.should == "a_weird_name_1.csv"
  end

  it "shoud have a sha" do
    r = Report.new(:name => "A another", :sql => "SELECT * FROM students")
    r.checksum.should eq(nil)
    r.save
    r.checksum.should == "e5e78c9bcec0418c852d1b035ff615a3462f4ccd"
    r.run.should == ""
    r.sql = "select * from students"
    lambda { r.run }.should raise_error
  end
end
