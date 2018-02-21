require 'json'

class Session
  attr_reader :cookie_name

  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req
    @cookie_name = '_rails_lite_app'
    
    cookies = req.cookies
    if cookies.key?(@cookie_name)
      @cookie_val = JSON.parse(cookies[@cookie_name])
    else
      @cookie_val = {}
    end
  end

  def [](key)
    @cookie_val[key]
  end

  def []=(key, val)
    @cookie_val[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie_vals = {
      value: JSON.generate(@cookie_val),
      path: "/"
    }
    res.set_cookie(@cookie_name, cookie_vals)
  end
end
