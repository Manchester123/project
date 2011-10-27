require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')

describe SearchPhoto do

  before :each do
    @search = SearchPhoto.new
  end

  it "should return valid number of elements, which saticfy condition in test" do
    
    params = {:category => 1, :words => 'upload'}
    info = @search.search(params)
    info.size.should == 3
    
  end
  
  it "should return false if number of parameters is wrong" do
    params = {:category => 1}
    info = @search.search(params)
    
    info.size.should == 0
  end
  
  it "should return false if number of parameters is wrong" do
    params = {:words => 1}
    info = @search.search(params)
    
    info.size.should == 0
  end
end
