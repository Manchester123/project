require '../models/photo'

describe Photo do
  before :each do
    @photo = Photo.new
  end

  it "should add photo using add_photo method" do
    params = {
      "category" => 1,
      "title" => "some title",
      "description" => "first description",
      "tags" => "topcoder, ferrumlogic, codeforces",
      "name" => "some name"
    }
    status = @photo.add_photo(params)
    status.should == true
  end
  
  it "should find photo by id" do
    info = @photo.find_by_id(3);
    info['id'].should == 3
  end

  it "should retrun false if photo not found" do
    info = @photo.find_by_id(3)
    info.length.should == 0
  end

end
