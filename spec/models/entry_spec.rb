require 'spec_helper'

describe  Entry do

  it { should have_many(:tasks).through(:entry_tasks) }

  it { should have_many(:entry_tasks) }

  it { should belong_to(:user)  }

  [:date_of_service,:duration_of_service,:group_size].each do |m|
    it { should validate_presence_of(m) }
  end
end
