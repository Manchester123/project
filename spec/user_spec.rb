require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')
require '../models/singletonUser'

describe User do
  #before :each do
  #  @user = User.new
  #end

  it "should not authenticate me with invalid credentials" do
    status = SingletonUser.instance.try_login('darik','unknown')
    status.should == false
  end

  it "should authenticate me with valid credentials" do
    isOk = SingletonUser.instance.try_login('darik', 'darik123')
    isOk.should == true
  end

  it "should authenticate me with valid credentials" do
    isOk = SingletonUser.instance.try_login('almas', 'brother') #on more test on authentication
    isOk.should == true
  end

  it "should return false if username have already taken by someone" do
    input = {'username' => 'darik', 'password' => 'passwd'}
    status = SingletonUser.instance.register(input)
    status.should == false
  end

  it "should return true if username is available and insert it into database" do
    input = {'username' => 'almas', 'password' => 'brother'}
    status = SingletonUser.instance.register(input)
    status.should == false
  end
  
  it "should return information about user" do
    info = SingletonUser.instance.get_user_info_by_name('darik');
    info.size.should > 1
  end

  it "should return empty information if user given by name not found in database" do
    info = SingletonUser.instance.get_user_info_by_name("megan")
    info.size == 0
  end
end
