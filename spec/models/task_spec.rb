require 'spec_helper'

describe Task do

  it { should belong_to(:category) }

  it { should have_many(:entries).through(:entry_tasks) }
  it { should have_many(:entry_tasks) }

  it { should validate_uniqueness_of(:name) }
  [:name ].each do |m|
    it { should validate_presence_of(m) }
  end
end
