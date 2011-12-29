#require './ex51/version'
require 'rubygems' # Needed for ruby 1.8.7
require 'sinatra'
require 'erb'

module Gothonweb
   get '/' do
      greeting = "Hello world!"
      erb :index, :locals => {:greeting => greeting}
   end
   
   get '/hello' do
      erb :hello_form
   end
   
   post '/hello' do
      greet = params[:greet] || "Hello"
      name = params[:name] || "Nobody"
      greeting = "#{greet}, #{name}"
      erb :index, :locals => {:greeting => greeting}
   end

end
