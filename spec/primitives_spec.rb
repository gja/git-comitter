require File.dirname(__FILE__) + '/spec_helper.rb'

describe GitComitter do
  before(:each) do
    clear_flags
  end

  it "Should be able to accept a push" do
    accept
    state.should == :accepted
  end

  it "Should print out a message when accepting" do
    accept :message => "Dude, you can commit"
    message.should == "Dude, you can commit"
  end

  it "Should be able to deny a commit" do
    deny
    state.should == :denied
  end

  it "Should print out a message when denying" do
    deny :message => "Dude, you can't commit"
    message.should == "Dude, you can't commit"
  end
end
