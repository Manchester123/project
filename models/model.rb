require 'md5'

class Model
  attr_accessor :con

  def get_connection
    @con = MysqlConnect.new
    return @con
  end  
  
  def close_connection
    @con.close
  end
  
  def map_data(sql_obj)
    
    ret = []
    sql_obj.each_hash{ |row|
      ret << row
    }
    return ret
  end
end
