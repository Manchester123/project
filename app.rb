require 'rubygems'
require 'sinatra'
require 'haml'
require 'connector.rb'
require 'models/user.rb'
require 'models/photo.rb'
require 'utils.rb'
enable :sessions

get '/hi' do

  if (session['count'] == nil) then
    session['count'] = 0
  end

  session['count']+=1
  session['username'].to_s
  #session['id'].to_s
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
    
    user_info = user.get_user_info_by_name(username)
    session['id'] = user_info['id']
    session['username'] = user_info['username']
    
    haml :login_success
  else
    haml :login_failure
  end
end

post '/logout' do
  session['id'] = nil
  session['username'] = nil
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


get '/search' do
  category = params[:category]
  name = params[:name]
  
  
end

get '/view/:id' do
  
  id = params[:id]
  id = id.to_i
  
  photo = Photo.new
  info = photo.find_by_id(id)
  
  haml :view
end

get '/upload' do
    haml :upload_pic

end

post '/upload' do

    unless params[:file] &&
               (tempfile = params[:file][:tempfile]) &&
               (name = params[:file][:filename])
          
          redirect '/upload'
    end 
    unless params[:file][:filename].nil?
    tempfile = params[:file][:tempfile]
    
    utils = Utils.new
    name = utils.generate_random_str(25)
    dir = "./uploadedFiles/"
    path = File.join(dir, name)

    File.open(path, "wb"){|f| f.write(tempfile.read)}
    
    pars = {
      'category' => params[:category],
      'title' => params[:title],
      'description' => params[:description],
      'tags' => params[:tags],
      'name' => name,
    }
    
    photos = Photo.new
    photos.add_photo(pars)
            
    redirect '/upload'
    end
end

