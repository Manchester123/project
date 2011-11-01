require File.dirname(__FILE__) + '/../bin/app.rb'
require 'rack/test'

set :environment, :test

def app
    Sinatra::Application
end

describe "App Controller" do

    include Rack::Test::Methods

    it "should get the index page" do
	get '/'
	last_response.should be_ok
	last_response.body.should include("head")
	last_response.body.should include("input")
    end
    
    it "should call try_login method" do
	post '/login', params = {:username => 'darik', :password => 'something'}
	user = User.new
	user.should respond_to(:try_login)
    end
    
    it "should redirect after logout" do
	get '/logout'
	last_response.should be_redirect
    end
    
    it "should call validate method when trying to register" do
	post '/register', params = {:username => 'darik', :pwd => "123", :cpwd => "123"}
	utils = Utils.new
	utils.should respond_to(:validate)
    end
    
    it "should redirect if parameters for registration invalid (password)" do
	post '/register', params = {:username => 'darik', :pwd => "123", :cpwd => "123"}
	last_response.should be_redirect
    end
    
    it "should redirect if parameters for registratino invalid (username)" do
	post '/register', params = {:username => 'darik', :pwd => "123", :cpwd => "123"}
	last_response.should be_redirect
    end
    
    it "should call register method and redirect to / if parameters are valid" do
	post '/register', params = {:username => 'darik', :pwd => "123543", :cpwd => "123543"}
	user = User.new
	user.should respond_to(:register)
	last_response.should be_redirect
    end
    
    it "should redirect if session has already been set" do
	post '/login', params = {:username => "robrob", :password => "robrob"}#change password or username to fail the test
	get '/register'
	last_response.should be_redirect
    end
    
    it "should redirect if session has already been set" do
	post '/login', params = {:username => "robrob", :password => "robrob"}#change password or username to fail the test
	get '/'
	last_response.should be_redirect
    end
    
    it "should redirect to login page if users tries to upload image without session" do
	get '/upload'
	last_response.should be_redirect
    end
    
    it "should redirect to upload page again if some parameters are missing" do
	post '/upload', params = {}
	last_response.should be_redirect
    end
    
    it "should redirect to login page, when trying to comment without authentication" do
	post '/comment', params = {}
	last_response.should be_redirect
    end
    
    it "should invoke add_comment method and refresh the page" do
	post '/comment', params = {:user_id => '1', :pic_id => '1', :description => "something"}
	comment = Comment.new
	comment.should respond_to(:add_comment)
	last_response.should be_redirect
    end
    
    it "should call get_comment and find_by_id methods on comments and photos object correspondently" do
	get '/view', params = {:id => 11}
	comment = Comment.new
	comment.should respond_to(:get_comment)
	
	photo = Photo.new
	photo.should respond_to(:find_by_id)
    end
    
    
  it "should response to search page" do
    post '/search/1/winnie', params = {:category => 1, :words => 'winnie'}
    last_response.should be_ok
    
    search_util = SearchPhoto.new
    search_util.should respond_to(:search)
  end
  
  it "should response to search page (get)" do
    get '/search'
    last_response.should be_ok
  end

  it "should responce to display page (get)" do
    get '/display'
    last_response.should be_ok
  end
end
