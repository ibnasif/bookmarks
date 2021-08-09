require 'sinatra/base'
require "sinatra/reloader" 




class Bookmarks < Sinatra::Base
  

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'hello world.'
  end


  run! if app_file == $0


end