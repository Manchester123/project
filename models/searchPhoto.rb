class SearchPhoto
  
  def search(params,id)
    
    category = params[:category]
    words = params[:words]
    
    return [] if category == nil
    return [] if words == nil
    
    query = "select * from photos where( "
    words.strip.each(" "){ |q|
      q = q.strip
      if query == "select * from photos where( " then
        query = query + "title like '%#{q}%' or description like '%#{q}%' or tags like '%#{q}%'"
      else
        query = query + "or title like '%#{q}%' or description like '%#{q}%' or tags like '%#{q}%'"
      end
    }
    query = query + ") and category=" + category.to_s
    query = query + " and user_id=" + id.to_s
    puts query
    db = MysqlConnect.new
    info = db.make_query(query, true)
    db.close
    
    ret = []
    info.each_hash{ |row|
    
      map = {
        'id' => row['id'].to_i,
        'title' => row['title'],
        'description' => row['description'],
        'name' => row['name'],
        'tags' => row['tags'],
      }
      ret << map
    }
    
    return ret
  end
end
