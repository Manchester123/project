require File.dirname(__FILE__) + '/../connector.rb'
require 'md5'

class Comment < Model
  attr_accessor :comment_id, :description, :pic_id, :user_id
  
  def add_comment(map)
    return false if !validate_add(map)
    #desc = map[:description]
    #return false if desc == nil
    #user_id = map[:user_id]
    #return false if user_id == nil
    #pic_id = map[:pic_id]
    #return false if pic_id == nil
    
    #db = MysqlConnect.new
    sql = "INSERT INTO comments (description, user_id, pic_id) value ('" + map[:description] + "', " + map[:user_id].to_s + ", " + map[:pic_id].to_s + ")"
    #db.make_query(sql)
    get_connection.make_query(sql)
    close_connection
    
    return true;
  end
  
  def get_comment(picture_id)
  
    comments = get_connection.make_query("SELECT * FROM comments where pic_id=" + picture_id.to_s, true)
    res = map_data(comments)
    close_connection
    return res
    
    #db = MysqlConnect.new
    #comments = db.make_query("SELECT * FROM comments where pic_id=" + picture_id.to_s, true)
    
    #res = []
    #comments.each_hash {|row|
    #  map={:description=>row['description'], :user_id=>row['user_id'], :pic_id=>row['pic_id']}
    #  res << map
    #}
  
    #db.close
    #return res
  end  
  
  def validate_add(map)  
    desc = map[:description]
    return false if desc == nil
    user_id = map[:user_id]
    return false if user_id == nil
    pic_id = map[:pic_id]
    return false if pic_id == nil 
    
    return true
  end
end
