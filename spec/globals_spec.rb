require File.dirname(__FILE__) + '/spec_helper.rb'

# These tests are run against the current git repository

describe GitComitter do
  before(:each) do
    setup_globals Git.open("."), 'refs/heads/master', '32d1f0b9ed4abe7fd51a2678b7c8dd709fe6f34d', '291dcd04238998b9a901188689e20ba42be83672'
  end

  it "should have set up branch and sha as global constants" do
    branch.should == 'refs/heads/master'
    old_sha.should == '32d1f0b9ed4abe7fd51a2678b7c8dd709fe6f34d'
    new_sha.should == '291dcd04238998b9a901188689e20ba42be83672'
  end

  it "should get a list of commits" do
    commits.should have(5).things
    commits.map{|c| c.sha}.should == ["291dcd04238998b9a901188689e20ba42be83672", "c57f9601dac033bda72e20d39d31670785ebc472", "dc905cb24791a16c940b4b685be4e459f63177f4", "552192da1cb0e951dfc3f88c2da15c7e457be4cc", "6f68bef6dd15c560042e6eda4722868b0ed99550"]
  end
end
