require File.dirname(__FILE__) + '/spec_helper.rb'

class MockMatcher
  def match(commits)
    @commits = commits
  end

  attr_reader :commits
end

describe GitComitter do
  before(:each) do
    @commit1 = mock("commit1")
    @commit2 = mock("commit2")
    @commit3 = mock("commit3")
    
    self.stub!(:commits).and_return([@commit1, @commit2, @commit3])
    @matcher = MockMatcher.new
  end

  it "should be able to match against all commits" do
    all_commits @matcher
    @matcher.commits.should == commits
  end

  it "should be able to match the latest commit" do
    latest_commit @matcher
    @matcher.commits.should == [@commit1]
  end

  it "should be able to match the first commit" do
    first_commit @matcher
    @matcher.commits.should == [@commit3]
  end
end
