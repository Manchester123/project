require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')
require '../models/singletonPhoto'

describe Photo do
#  before :each do
#    @photo = Photo.new
#  end

  it "should add photo using method add_photo and return true if insert has been successful" do
    params = {
      "category" => 1,
      "title" => "some title",
      "description" => "first description",
      "tags" => "topcoder, ferrumlogic, codeforces",
      "name" => "some name",
      "user_id" => 1
    }
    status = SingletonPhoto.instance.add_photo(params)
    status.should == true
  end
  
  it "should find record(information about photo) in database by id" do
    info = SingletonPhoto.instance.find_by_id(20);
    info.size.should > 1
  end

  it "should retrun false if record not found in database by given criteria" do
    info = SingletonPhoto.instance.find_by_id(-1)
    info.length.should == 0
  end

end
