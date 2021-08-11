require 'pg'

class Bookmark 

  attr_accessor :bookmarks
  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bm_test')

    else 
      connection = PG.connect(dbname: 'bookmark_manager')

    end


    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark| 
      bookmark['url']
    end
    
    
  end


  def self.add(url)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bm_test')

    else 
      connection = PG.connect(dbname: 'bookmark_manager')

    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end



  
end