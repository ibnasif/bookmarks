require 'pg'

def setup
  p 'setting up test database...'

  connection = PG.connect(dbname: 'bm_test')

#clear the bookmarks table

  connection.exec("TRUNCATE bookmarks;")
end