#require File.dirname(__FILE__) + '/../connector.rb'
#require File.dirname(__FILE__) + '/../utils.rb'
require 'md5'

class Photo
  
  def add_photo(params)
    
    db = MysqlConnect.new

    sql_query = "INSERT INTO photos (category, title, description, tags, name , user_id) value ('"+params['category']+"', '"+params['title']+"','"+params['description']+"', '"+params['tags']+"', '"+params['name']+"', '"+params['user_id']+"')"
    db.make_query(sql_query, false)
    db.close
    
    return true;
  end
  
  def get_id

	db = MysqlConnect.new
	sql_query = "SELECT MAX(id) as id FROM photos"
	query = db.make_query(sql_query, true)
	ret = [];
    query.each_hash{ |row|


      map = {
        'id' => row['id'].to_i,
      }
      ret << map
    }
    db.close

	
	return ret[0]['id'];
  
  end
  
  def find_by_id(id)
    
    db = MysqlConnect.new
    sql_query = "SELECT * FROM photos where id=#{id}"
    info = db.make_query(sql_query, true)
    
    ret = [];
    info.each_hash{ |row|
    
      map = {
        'id' => row['id'].to_i,
        'title' => row['title'],
        'description' => row['description'],
        'name' => row['name'],

      }

      ret << map
    }
    puts ret.to_s
    db.close
    
    return [] if ret.length == 0
    return ret[0]
  end


  def find_by_user_id(id)

    db = MysqlConnect.new
    sql_query = "SELECT * FROM photos where user_id=#{id}"
    info = db.make_query(sql_query, true)

    ret = [];
    info.each_hash{ |row|

      map = {
        'id' => row['id'].to_i,
        'title' => row['title'],
        'description' => row['description'],
        'name' => row['name'],
        'user_id' => row['user_id']

      }

      ret << map
    }
    puts ret.to_s
    db.close

    return [] if ret.length == 0
    return ret
  end
  
end
