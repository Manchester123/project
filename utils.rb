require 'md5'

class Utils
  def validate(input)
    #validation of string goes here
    return input
  end

  def validate_password(pwd, cpwd)
    return false if pwd != cpwd
    return false if pwd.length < 5
    return true
  end

  def validate_username(username)
    return false if username.length < 4
    return true
  end

  def generate_random_str(len = 5)
    str = "abcdefjhijklmnopqrstuvwzyz1234567890"
    random = ""
    while random.length < len do
      random = random + str[rand(str.length - 1)].chr
    end
    return random
  end

  def get_hash(str)
    return Digest::MD5.hexdigest(str)
  end

  def get_current_time
    t = Time.new
    return t.strftime("%Y-%m-%d %H:%M:%S")
  end
end
