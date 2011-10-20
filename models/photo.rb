require 'connector.rb'
require 'utils.rb'
require 'md5'

class Photo
  
  def add_photo(params)
    
    db = MysqlConnect.new
    sql_query = "INSERT INTO photos (category, title, description, tags, name) value ('"+params['category']+"', '"+params['title']+"','"+params['description']+"', '"+params['tags']+"', '"+params['name']+"')"
    db.make_query(sql_query, false)
    db.close
    
    return true;
  end
  
  def find_by_id(id)
    
    db = MysqlConnect.new
    sql_query = "SELECT * FROM photos where id=#{id}"
    info = db.make_query(sql_query, true)
    
    ret = [];
    info.each_hash{ |row|
    
      puts row['id'].to_s
      map = {
        'id' => row['id'].to_i,
        'title' => row['title'],
        'description' => row['description'],
        'name' => row['name'],
      }
      ret << map
    }
    db.close
    
    return [] if ret.length == 0
    return ret[0]
  end
end
