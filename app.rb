require 'sinatra/base'
require "sinatra/reloader" 
require_relative "./lib/bookmarks.rb"
require 'pg'




class Bookmarks < Sinatra::Base
  

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'hello world.'
  end

  get '/bookmarks' do
    
    #print ENV variable
    p ENV
    
    @bookmarks = Bookmark.all
    erb :bookmarks
    
  end

  get '/bookmarks/new' do
    
    erb :adding_bookmark
  end

  post '/bookmarks' do
    url = params['url']
    connection = PG.connect(dbname: 'bm_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end






  run! if app_file == $0


end