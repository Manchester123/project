require 'mysql'

class MysqlConnect
  
  attr_reader :con
  def initialize
    @con = Mysql::new('localhost', 'root', 'root', 'ruby')
  end

  def make_query(query, with_return = false)
    res = @con.query(query)
    return res if with_return
  end

  def close
    @con.close
  end
end
