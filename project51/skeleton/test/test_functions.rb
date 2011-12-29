require 'test/unit'

def assert_response(resp, contains=nil, matches=nil, headers=nil, status=200)

   assert_equal(resp.status, status, "Expected response #{status} not in #{resp}")
   
   if status == 200
      assert(resp.body, "Response data is empty.")
   end
   
   if contains
      assert((resp.body.include? contains), "Response does not contain #{contains}")
   end
   
   if matches
      reg = Regexp.new(matches)
      assert reg.match(contains), "Response does not match #{matches}"
   end
   
   if headers
      assert_equal(resp.headers, headers)
   end

end
