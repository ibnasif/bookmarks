require 'pg'

class Bookmark 

  attr_accessor :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end




  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bm_test')

    else 
      connection = PG.connect(dbname: 'bookmark_manager')

    end


    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark| 
      
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      
      
    end
    
    
  end


  def self.add(url:, title:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bm_test')

    else 
      connection = PG.connect(dbname: 'bookmark_manager')

    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])

  end



  
end