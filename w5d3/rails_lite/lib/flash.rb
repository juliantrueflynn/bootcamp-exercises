require 'json'
require 'byebug'

class Flash
  def self.now

  end

  attr_reader :req, :cookie_name

  def initialize(req)
    @req = req
    @cookie_name = '_rails_lite_app_flash'

    cookies = req.cookies
    if cookies.key?(@cookie_name)
      @cookie_val = JSON.parse(cookies[@cookie_name])
    else
      @cookie_val = {}
    end
  end

  def store_flash(res)
    res.delete_cookie(cookie_name)
    values = {
      value: JSON.generate(@cookie_val),
      path: "/"
    }
    res.set_cookie(cookie_name, values)
  end
  
  def [](key)
    @cookie_val[key.to_s]
  end

  def []=(key, val)
    @cookie_val[key.to_s] = val
  end
end
