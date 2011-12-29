require '../lib/gothonweb'
require 'test/unit'
require 'rack/test'
require './test_functions'

ENV['RACK_ENV'] = 'test'

class GothonTest < Test::Unit::TestCase
  include Rack::Test::Methods

   # gothonweb is the application
   def app
      Sinatra::Application
   end

   # Try to get a page that does not exist => Error 404
   def test_error_404()
      get '/foo'
      assert_response(last_response, nil, nil, nil, 404)
   end
   
   # Get hello page
   def test_get_hello()
      get '/hello'
      assert_response(last_response, "Fill out this form", nil, nil, 200)
   end
   
   # Post an empty form
   def test_post_hello
      post '/hello'
      assert_response(last_response, nil, nil, nil, 200)
   end
   
   # Post a form with a name
   def test_post_hello_name
      post '/hello?name=david'
      assert_response(last_response, "david", nil, nil, 200)
   end
   
   # Post a form with a greeting and a name
   def test_post_greeting_name
      post '/hello', {:greet => "whats up?", :name => "david"}
      assert_response(last_response, "whats up?, david", nil, nil, 200)
   end
end
