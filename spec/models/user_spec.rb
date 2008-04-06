require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  it "should be valid" do
    @user.should be_valid
  end
  
  it "should return a user when finding by OpenId URL" do
    @user.name = 'Test'
    @user.openid_url = 'http://claimid.com/testing_user'
    @user.save
    retrieved_user = User.find_by_openid_url('http://claimid.com/testing_user')
    retrieved_user.should_not be_nil
    retrieved_user.name.should == 'Test'
    retrieved_user.openid_url.should == 'http://claimid.com/testing_user'
    retrieved_user.destroy
  end
end
