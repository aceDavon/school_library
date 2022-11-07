require './app'
require './init'

class Request
  def initialize
    @inst = App.new
  end

  def request(selection)
    case selection
    when '1'
      @inst.all_books
      Init.new
    when '2'
      @inst.all_people
      Init.new
    when '3'
      @inst.create_person
      Init.new
    when '4'
      book
    when '5'
      @inst.create_rental
      Init.new
    when '6'
      @inst.all_rentals
      Init.new
    else
      p 'Thanks for using this app, See you again'
      exit
    end
  end
end
