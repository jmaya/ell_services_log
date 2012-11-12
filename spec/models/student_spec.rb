require 'spec_helper'

describe Student do
  it { should have_many :assessments }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :number }
end
