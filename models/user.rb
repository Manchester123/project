require 'connector.rb'
require 'utils.rb'
require 'md5'

class User
  
  def try_login(username, password)
    
    db = MysqlConnect.new
    user_info = db.make_query("SELECT * FROM accounts where username='" + username + "'", true)
    res = []
    user_info.each_hash{ |row|
      map = {
        'username' => row['username'],
        'password' => row['password'],
        'salt' => row['salt'],
        'date_reg' => row['date_reg'],
        'id' => row['id']
      }
      res << map
    }
    
    db.close
    return false if res.size == 0
    user_info = res[0]

    utils = Utils.new

    password_hash = utils.get_hash(password) + utils.get_hash(user_info['salt'])
    password_hash = utils.get_hash(password_hash)

    return false if password_hash != user_info['password']
    return true
  end
  
  def register(params)
    
    username = params['username']
    password = params['password']
    
    db = MysqlConnect.new
    user_info = db.make_query("SELECT * FROM accounts where username='" + username +"'", true)
    
    res = []
    user_info.each_hash{ |row|
      
      map = {
        'username' => row['username'],
        'password' => row['password'],
        'salt' => row['salt'],
        'date_reg' => row['date_reg'],
        'id' => row['id']
      }
      res << map
    }
    if res.size > 0 then
      db.close
      return false
    end

    utils = Utils.new
    salt = utils.generate_random_str(5)
    password = utils.get_hash(password) + utils.get_hash(salt)
    password = utils.get_hash(password)
    time = utils.get_current_time
        
    db.make_query("INSERT INTO accounts (username, password, date_reg, salt) values ('" + username +"', '" + password +"', '" + time +"','" + salt + "')")
    db.close
    return true
  end
end
