require File.dirname(__FILE__) + '/spec_helper.rb'

# These tests are run against the current git repository
describe GitComitter do
  before(:each) do
    setup_globals '.', 'refs/heads/master', '32d1f0b9ed4abe7fd51a2678b7c8dd709fe6f34d', '291dcd04238998b9a901188689e20ba42be83672'
    clear_flags
  end

  it "Should be able to accept a push" do
    accept
    state.should == :accepted
  end

  it "Should be able to deny a commit" do
    deny
    state.should == :denied
  end

  it "Should accept if a passing condition is recieved" do
    if_condition_passes = mock(:evaluate_match => true)
    accept if_condition_passes
    state.should == :accepted
  end

  it "Should not accept if a failing condition is recieved" do
    if_condition_passes = mock(:evaluate_match => false)
    accept if_condition_passes
    state.should == :neutral
  end

  it "Should deny if a passing condition is recieved" do
    if_condition_passes = mock(:evaluate_match => true)
    deny if_condition_passes
    state.should == :denied
  end

  it "Should not deny if a failing condition is recieved" do
    if_condition_passes = mock(:evaluate_match => false)
    deny if_condition_passes
    state.should == :neutral
  end
end
