require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')
require '../models/singletonComment'

describe Comment do

  it "should fail to add a comment" do
    map={:blah=>"fgfj",:foo=>"fo"}
    SingletonComment.instance.add_comment(map).should == false
  end
  
  it "should add a row to database if data is valid" do
    map = {:description=>'first comment', :user_id=>1, :pic_id=>1}
    SingletonComment.instance.add_comment(map).should == true
  end
  
  it "should return all commets of picture by given id" do
    comments_array = SingletonComment.instance.get_comment(20)
    comments_array.size.should > 1
  end
end
