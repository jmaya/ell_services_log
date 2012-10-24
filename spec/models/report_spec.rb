require 'spec_helper'

describe Report do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}
  it { should validate_presence_of :sql }
  it { should validate_uniqueness_of :sql}
end
