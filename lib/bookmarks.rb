require 'pg'

class Bookmark 

  attr_accessor :bookmarks
  def self.all

    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark| 
      bookmark['url']
    end
    
    
  end

  
end