require 'bookmarks'

describe Bookmark do

  
  
  it 'returns all bookmarks' do

    connection = PG.connect(dbname: 'bm_test')

    #add the test data

    # Add the test data
    
    bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.add(url: "http://www.google.com", title: "Google")

  
    bookmarks = Bookmark.all


    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end
       





  
  
  



  it 'creates a new bookmark' do
    bookmark = Bookmark.add(url: 'http://www.example.org', title: 'Test Bookmark')
    persisted_data = PG.connect(dbname: 'bm_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.example.org'
  end
end


  


