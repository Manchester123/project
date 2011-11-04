require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')
require '../models/singletonSearchPhoto'

describe SearchPhoto do

#  before :each do
#    @search = SearchPhoto.new
#  end

  it "should return rows from database matching given query, which satisfy condition in test" do
    
    params = {:category => 3, :words => 'chart'}
    info = SingletonSearchPhoto.instance.search(params, 7)
    info.size.should > 0
    
  end
  
  it "should return false if number of parameters is wrong" do
    params = {:category => 1}
    info = SingletonSearchPhoto.instance.search(params, 7)
    
    info.size.should == 0
  end
  
  it "should return false if number of parameters is wrong" do
    params = {:words => 1}
    info = SingletonSearchPhoto.instance.search(params, 1)
    
    info.size.should == 0
  end
end
