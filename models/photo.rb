require 'md5'

class Photo < Model
  
  def add_photo(params)
    
    utils = Utils.new
    params = utils.validate_params(params)

    get_connection.make_query("INSERT INTO photos (category, title, description, tags, name, user_id) value ('" + params['category'] + "', '" + params['title'] + "','" + params['description'] + "', '" + params['tags'] + "', '" + params['name'] + "', " + params['user_id'] + ")")
    close_connection    
    
    return true;
  end
  
  def get_id

	  info = get_connection.make_query("SELECT MAX(id) as id FROM photos", true)
	  ret = map_data(info)
	  close_connection
	  
	  return ret[0]['id'];
  end
  
  def find_by_id(id)
    
    id = get_connection.make_query("SELECT * FROM photos where id=#{id}",true)
    ret = map_data(id)
    close_connection
    
    return [] if ret.length == 0
    return ret[0]
    
  end


  def find_by_user_id(id)

    info = get_connection.make_query("SELECT * FROM photos where user_id=#{id}", true)
    ret = map_data(info)
    close_connection

    return [] if ret.length == 0
    return ret
  end
    
  def get_user_id(pic_id)
        
      info=get_connection.make_query("SELECT user_id FROM ruby.photos where id=#{pic_id}", true)
      ret = map_data(info)
      close_connection
      
      return ret[0]['user_id']
  end
  
  def delete_image(id)

  	get_connection.make_query("DELETE FROM ruby.photos where id=#{id}")
	close_connection
  	
  end
  
end
