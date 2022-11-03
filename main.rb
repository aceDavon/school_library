require './app'

class Main
  def initialize
    @inst = App.new
  end

  def init
    ['Please choose an option by entering a number', '1 - List all books.', '2 - List all people.', '3 - Create a person(1 - teacher or 2 - student).', '4 - Create a book.', '5 - Create a rental.', '6 - List all rentals for a given person id.', '7 - Exit'].each { |opt| puts opt}
  req = gets.chomp
  request(req)
  end

  def request(selection)
    if(selection.to_i == 1)
      @inst.all_books
      init
    elsif(selection == '2')
      @inst.all_people
      init
    elsif(selection == '3')
      p 'Please enter an option, 1 for Teacher, 2 for Student'
      res = gets.chomp
      @inst.create_person(res)
      init
    elsif(selection == '4')
      book
    elsif(selection == '5')
      @inst.create_rental
    elsif(selection == '6')
      p 'Please enter an ID for this rental'
      resp = gets.chomp
      all_rentals(resp)
    elsif(selection == '7')
      p 'Thanks for using this app, See you again'
      exit
    else
      p 'Invalid Entry, Please select from the options above'
      p selection
    end
  end

  def book
    p 'Enter title: '
    title = gets.chomp
    p 'Enter Author: '
    author = gets.chomp
    @inst.create_book(title, author)
    init
  end
end

obj = Main.new
obj.init