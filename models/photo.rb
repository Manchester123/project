require File.dirname(__FILE__) + '/../connector.rb'
require File.dirname(__FILE__) + '/../utils.rb'
require File.dirname(__FILE__) + '/model'
require 'md5'

class Photo < Model
  
  def add_photo(params)
    
    get_connection.make_query("INSERT INTO photos (category, title, description, tags, name) value ('"+params['category']+"', '"+params['title']+"','"+params['description']+"', '"+params['tags']+"', '"+params['name']+"')")
    close_connection    
    
    return true;
    
  end
  
  def find_by_id(id)
    
    id = get_connection.make_query("SELECT * FROM photos where id=#{id}",true)
    ret = map_data(id)
    close_connection
    
    return [] if ret.length == 0
    return ret[0]
    
  end
end
