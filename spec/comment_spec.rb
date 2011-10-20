require '../models/comment'

describe Comment do

  before :each do
    @comment = Comment.new
  end

  #it "should fail to add a comment" do
  #  map={:blah=>"fgfj",:foo=>"fo"}
  #  status=@comment.add_comment(map)
  #  status.should == false
  #end
  
  #it "should add a row to database if data is valid" do
  #  map = {:description=>'first comment', :user_id=>1, :pic_id=>1}
  #  status = @comment.add_comment(map)
  #  status.should == true
  #end
  
  it "should return all commets of picture by given id" do
    res = @comment.get_comment(1)
    res.size.should == 3
  end
end
