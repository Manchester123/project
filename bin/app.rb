#!/usr/bin/env ruby

require 'rubygems'
#require 'bundler/setup'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__), '..', 'lib', 'cmsasd')

set :root, File.join(File.dirname(__FILE__), '..')
enable :sessions

get '/hi' do

  if (session['count'] == nil) then
    session['count'] = 0
  end

  session['count']+=1
  session['username'].to_s
end

get '/' do
  if (session['id']) then
    redirect '/upload'
  end
  haml :index
end

post '/login' do

  if (session['id']) then
    redirect '/upload'
  end

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

get '/logout' do
  session['id'] = nil
  session['username'] = nil
  
  redirect '/'
end

post '/register' do
  
  username = params[:username]
  pwd = params[:pwd]
  cpwd = params[:cpwd]
  
  utils = Utils.new
  username = utils.validate(username)
  
  if !utils.validate_password(pwd, cpwd) then
    redirect '/register'
  end
  
  if !utils.validate_username(username) then
    redirect '/register'
  end
    
  params = {};
  #params << username << pwd << cpwd
  params['username'] = username
  params['password'] = pwd;
  
  user = User.new
  status = user.register(params)
  
  if status then
    redirect "/"
  else
    redirect "/register"
  end
end

get '/register' do

  if(session['id']) then
    redirect '/upload'
  end

  haml :register
end


post '/search' do

  search_util = SearchPhoto.new
  @search_res = search_util.search(params)
  
  haml :search_res
end

get '/search' do
  
  haml :search_pic 
end
#get '/view/:id' do
  
#  id = params[:id]
#  id = id.to_i
  
#  photo = Photo.new
#  info = photo.find_by_id(id)
  
#  haml :view
#end

get '/upload' do

    if (session['id'] == nil) then
      redirect '/'
    end

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
    name = utils.generate_random_str(25) + ".jpg"
    dir = "./public/photos/"
    path = File.join(dir, name)

    File.open(path, "wb"){|f| f.write(tempfile.read)}
    
    pars = {
      'category' => params[:category],
      'title' => params[:title],
      'description' => params[:description],
      'tags' => params[:tags],
      'name' => name,
      'user_id' => session['id']
    }
    
    photos = Photo.new
    photos.add_photo(pars)
            
    redirect '/view/' + photos.get_id.to_s
    end
    
end

get '/view/:id' do

  id = params[:id].to_i

  comment = Comment.new
  @comment_info = comment.get_comment(id)
  
  photo = Photo.new
  @photo_info = photo.find_by_id(id)
  @all_photos = photo.find_by_user_id(session['id'])

  id_table=[]
  @all_photos.each { |photo|
      id_table.push(photo['id'])
  }

  found = id_table.index(id)
  @next = (id == id_table.last) ? id : id_table[found + 1]
  @previous = (id == id_table.first) ? id : id_table[found - 1]


  haml :show_image
end

post '/comment' do
  
  if (session['id'].nil?) then
    redirect '/'
  end
  
  comment = Comment.new
  comment.add_comment(params)
  
  redirect '/view/' + params[:pic_id].to_s
end

get '/display' do
   @photos = [];
   #for i=0..9 in
   #  photos[i] = Photos.new('User Story', "pic"+"#{i}" ,'just a user story', '--','pic1')
   #end
  photo = Photo.new
   #puts "id here "+"#{session['id']}"
  @photos=photo.find_by_user_id(session['id'])
    haml :display
end
