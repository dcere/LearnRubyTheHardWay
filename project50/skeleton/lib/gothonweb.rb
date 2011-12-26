require './ex50/version'
require 'rubygems' # Needed for ruby 1.8.7
require 'sinatra'
require 'erb'

module Gothonweb
   get '/' do
      greeting = "Hello world!" # Shows the customized greeting
      #greeting = nil            # Shows the default greeting
      erb :index, :locals => {:greeting => greeting}
   end
end
