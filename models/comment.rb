require 'connector.rb'
require 'md5'

class Comment
  attr_accessor :comment_id, :description, :pic_id, :user_id
  
  def add_comment(map)
    desc = map[:description]
    return false if desc == nil
    user_id = map[:user_id]
    return false if user_id == nil
    pic_id = map[:pic_id]
    return false if pic_id == nil
    
    db = MysqlConnect.new
    sql = "INSERT INTO comments (description, user_id, pic_id) value('" + desc + "', " + user_id.to_s + ", " + pic_id.to_s + ")"
    db.make_query(sql)
    
    db.close
    
    return true;
  end
  
  def get_comment(picture_id)
  
    db = MysqlConnect.new
    comments = db.make_query("SELECT * FROM comments where pic_id=" + picture_id.to_s, true)
    
    res = []
    comments.each_hash {|row|
      map={:description=>row['description'], :user_id=>row['user_id'], :pic_id=>row['pic_id']}
      res << map
    }
  
    db.close
  
  
    return res
    
  
  end
    
end
