require 'md5'

class Comment < Model
  attr_accessor :comment_id, :description, :pic_id, :user_id
  
  def add_comment(map)
    return false if !validate_add(map)
    
    utils = Utils.new
    map = utils.validate_params(map)
    time = utils.get_current_time
    
    sql = "INSERT INTO comments (description, user_id, pic_id, date) value ('" + map[:description] + "', " + map[:user_id].to_s + ", " + map[:pic_id].to_s + ", '"+time+"')"
    get_connection.make_query(sql)
    close_connection
    
    return true;
  end
  
  def get_comment(picture_id)
  
    comments = get_connection.make_query("SELECT * FROM comments left join accounts on comments.user_id=accounts.id where pic_id=" + picture_id.to_s, true)
    res = map_data(comments)
    close_connection
    
    return res
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
