require './book'
require './teacher'

class App
  def initialize
    @books = []
    @people = {students: [], teachers: []}
  end

  def all_books
    if @books.empty?
      puts 'There are no books created yet, Add some books to see them here :)'
    else
      @books.each {|bk| puts "\n Title: #{bk.title} by #{bk.author} \n \n"}
    end
  end
  
  def all_people 
    if @people.empty?
      puts 'There are no books created yet, Add some books to see them here :)'
    else
      @people.each do |keys, val|
        val.each {|peeps| puts "Name: #{peeps.age}, #{peeps.name} years old \n"}
      end
    end
  end
  
  def create_person(opt) 
    if(opt == '1')
      puts 'Enter Name of Teacher'
      name = gets.chomp
      puts 'Enter teacher\'s Age'
      age = gets.chomp
      puts 'What\'s teacher\'s specialization?'
      spec = gets.chomp
      new_person = Teacher.new(spec, name, age)
      @people[:teachers] << new_person unless @people[:teachers].include?(new_person)
    end
  end
  
  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << new_book unless @books.include?(new_book)
    p "Book #{title} by #{author} created successfully"
  end
  
  def create_rental 

  end
  
  def all_rentals(id) 

  end
end