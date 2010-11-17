require File.dirname(__FILE__) + '/spec_helper.rb'

# These tests are run against the current git repository
describe GitComitter do
  before(:each) do
    clear_flags
  end

  def mock_commit(email)
    mock(:author => mock(:email => email))
  end

  it "should be able to match author of a single commit" do
    self.stub!(:commits).and_return([mock_commit("tejas@gja.in")])
    all_commits(matches_email(/tejas/)).should == true
    all_commits(matches_email(/somethingelse/)).should == false
  end

  it "should not match unless all authors match pattern" do
    self.stub!(:commits).and_return([mock_commit("tejas@gja.in"), mock_commit("spam@gja.in")])
    all_commits(matches_email(/tejas/)).should == false
  end

  it "should be able to take a list of patterns" do
    self.stub!(:commits).and_return([mock_commit("tejas@gja.in"), mock_commit("spam@gja.in")])
    all_commits(matches_email(/tejas/, /spam/)).should == true
  end
end
