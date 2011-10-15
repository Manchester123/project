class Utils
  def vaildate(input)
    #validation of string goes here
    return input
  end

  def validate_password(pwd, cpwd)
    return false if pwd != cpwd
    return false if pwd.lenght < 5
    return true
  end

  def validate_username(username)
    return false if username.length < 4
  end
end
