require 'md5'

class User < Model
  
  def try_login(username, password)
    
    user_info = get_connection.make_query("SELECT * FROM accounts where username='" + username + "'", true)
    res = map_data(user_info)
    close_connection
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
    
    user_info = get_connection.make_query("SELECT * FROM accounts where username='" + username +"'", true)
    res = map_data(user_info)
    
    if res.size > 0 then
      close_connection
      return false
    end

    utils = Utils.new
    salt = utils.generate_random_str(5)
    password = utils.get_hash(password) + utils.get_hash(salt)
    password = utils.get_hash(password)
    time = utils.get_current_time
    
    get_connection.make_query("INSERT INTO accounts (username, password, date_reg, salt) values ('" + username +"', '" + password +"', '" + time +"','" + salt + "')")    
    close_connection
    
    return true
  end

  def get_user_info_by_name(username)
    
    user_info = get_connection.make_query("SELECT * FROM accounts where username='" + username +"'", true)
    res = map_data(user_info)
    close_connection
    
    return res[0]
  end
end
