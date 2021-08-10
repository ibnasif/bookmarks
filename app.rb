require 'sinatra/base'
require "sinatra/reloader" 
require_relative "./lib/bookmarks.rb"




class Bookmarks < Sinatra::Base
  

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'hello world.'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
    
  end


  run! if app_file == $0


end