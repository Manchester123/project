require 'connector.rb'
require 'md5'

class User
  
  def try_login(username, password)
    
    password = MD5.new(password)
    
    db = MysqlConnect.new
    res = db.make_query("SELECT * from student where name='" + username.to_s + "' AND rank='" + password.to_s + "'")
    
    return true if res != nil && res.size  > 0
    return false
  end
  
end
