require './request'
require './main'

class Init
  def initialize
    @req = Request.new
  end
  def init
    req = gets.chomp
    @req.request(req)
  end
end