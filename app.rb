require 'rubygems'
require 'sinatra'
require 'haml'
require 'connector.rb'
require 'models/user.rb'
require 'utils.rb'
require 'fileutils'


get '/hi' do
  
  #db = MysqlConnect.new
  #res = db.make_query("SELECT * from student", true)
  
  #res.each_hash do |row|
  #  puts row['id']
  #  puts row['name']
  #end
  #haml :hi
end

get '/' do
  haml :index
end

post '/login' do
  username = params[:username] 
  password = params[:password]

  user = User.new
  if user.try_login(username, password) then
    haml :login_success
  else
    haml :login_failure
  end
end

post '/register' do
  
  username = params[:username]
  pwd = params[:pwd]
  cpwd = params[:cpwd]
  
  utils = Utils.new
  username = utils.validate(username)
  pwd = utils.validate(pwd, cpwd)
  
  if !utils.validate_password(pwd, cpwd) then
    
  end
  
  if !utils.validate_username(username) then
    
  end
    
  params = {};
  #params << username << pwd << cpwd
  params['username'] = username
  params['pwd'] = pwd;
  
  user = User.new
  status = user.register(params)
  
  if status then
    redirect "/hi"
  else
    redirect "/register"
  end
end

get '/register' do
  haml :register
end

get '/upload' do
    haml :upload_pic

end

post '/upload' do

    unless params[:file] &&
               (tempfile = params[:file][:tempfile]) &&
               (name = params[:file][:filename])
          @error = "No file selected"
          redirect '/upload'
    end

    tempfile = params[:file][:tempfile]
    name = params[:file][:filename]
    dir = "./uploadedFiles/"
    path = File.join(dir, name)

    File.open(path, "wb"){|f| f.write(tempfile.read)}
    redirect '/upload'

end

post '/search' do
  params={};
  category=params[:category]
  key_words=params[:key_words]
  dir= "./uploadedFiles/"

end
