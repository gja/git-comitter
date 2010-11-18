require File.dirname(__FILE__) + '/spec_helper.rb'

describe GitComitter do
  before(:each) do
    clear_flags
  end

  it "Should be able to determine if a branch is in a particular list" do
    self.stub!(:full_branch).and_return("refs/heads/master")
    branch_is_in("master", "foo").should == true
    branch_is_in("foo", "bar").should == false
  end
end
