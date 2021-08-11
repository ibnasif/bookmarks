require 'bookmarks'

describe Bookmark do
  
  it 'returns all bookmarks' do

    connection = PG.connect(dbname: 'bm_test')

    #add the test data

    connection.exec("INSERT into bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT into bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT into bookmarks (url) VALUES('http://www.google.com');")


      

    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
    expect(bookmarks).to include("http://www.google.com")

  end
  
end