require '../models/user'

describe User do
  before :each do
    @user = User.new
  end

  it "should not authenticate me with invalid credentials" do
    status = @user.try_login('darik','unknown')
    status.should == false
  end

  it "should authenticate me with valid credentials" do
    status = @user.try_login('darik', 'darik123')
    status.should == true
  end

  it "should authenticate me with valid credentials" do
    status = @user.try_login('almas', 'brother')
    status.should == true
  end

  it "should return false if username have already taken by someone" do
    input = {'username' => 'darik', 'password' => 'passwd'}
    status = @user.register(input)
    status.should == false
  end

  it "should return true if username is available and insert it into database" do
    input = {'username' => 'almas', 'password' => 'brother'}
    status = @user.register(input)
    status.should == false
  end
  
  it "should return information about user" do
    info = @user.get_user_info_by_name('darik');
    puts info
    true.should == true;
  end
end
