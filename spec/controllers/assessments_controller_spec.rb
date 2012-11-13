require 'spec_helper'

describe AssessmentsController do
  include Devise::TestHelpers


  before (:each) do
    @user = FactoryGirl.create(:user)
    @student = FactoryGirl.create(:student)
    @student_id = @student.id
    sign_in @user
  end


  describe "GET 'new'" do
    it "returns http success" do
      get 'new', {:student_id => @student_id}
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      valid_attribs = {
        "assessment"=>
        {
          "name"=>"test",
          "grade"=>"b+",
          "assessed_at"=>"Fri, 09 Nov 2012"
        },
        "student_id"=>@student_id
      }
      get 'create', valid_attribs
      response.code.should == "302"
      @student.assessments.count.should == 1
    end
  end
  describe "PUT update" do
    describe "with valid params" do
      it "updates" do
        assessment = @student.assessments.create(:name => 'Test', :grade => 'A+', :assessed_at => Time.now)
        put :update, {
          :id => assessment.to_param,
          :student_id => @student_id,
          :assessment => {
            name:'The new name'
          }
        }
        response.code.should == "302"
      end
    end
  end
end
