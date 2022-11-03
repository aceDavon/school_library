require './book'
require './teacher'
require './rental'
require './student'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_books
    if @books.empty?
      puts "There are no books created yet, Add some books to see them here :( \n\n"
    else
      @books.each { |bk| puts "\n Title: #{bk.title} by #{bk.author} \n \n" }
    end
  end

  def all_people
    if @people.empty?
      puts "There are no persons created yet, Add users to see them here :( \n\n"
    else
      @people.each { |peeps| puts "\n Name: #{peeps.name}, Age: #{peeps.age} years old \n\n" }
    end
  end

  def create_person()
    p 'Please enter an option, 1 for Teacher, 2 for Student'
    res = gets.chomp
    case res
    when '1'
      puts 'Enter Name of Teacher'
      name = gets.chomp
      puts 'Enter teacher\'s Age'
      age = gets.chomp
      puts 'What\'s teacher\'s specialization?'
      spec = gets.chomp
      new_person = Teacher.new(spec, name, age)
      @people << new_person unless @people.include?(new_person)
      puts "\n User #{name} added successfully \n\n"
    when '2'
      puts 'Enter Student Name'
      name = gets.chomp
      puts 'What\'s your age?'
      age = gets.chomp
      puts 'What Class (Classes incluse 3b, 4a, 6c)?'
      classes = gets.chomp
      permission?
      new_student = Student.new(classes, name, age)
      @people << new_student unless @people.include?(new_student)
      puts "\n Student #{name} aged #{age} added successfully \n\n"
    end
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << new_book unless @books.include?(new_book)
    puts "\n Book #{title} by #{author} created successfully \n\n"
  end

  def permission?
    puts 'Do you have Parent\'s Permission (Y,y/N,n)?'
    permit = gets.chomp
    case permit
    when permit == 'y', 'Y'
      true
    when permit == 'n', 'N'
      false
    else
      puts 'Invalide entry, Please try again'
      permission?
    end
  end

  def create_rental
    puts "Here are the available books, Select by Index number \n"
    @books.each_with_index { |bk, i| puts "\n #{i + 1}. #{bk.title} by #{bk.author}  \n\n" }
    index = gets.chomp.to_i
    puts 'Who is renting this book?'
    @people.each_with_index { |bk, i| puts "#{i + 1} #{bk.name} aged #{bk.age}" }
    person = gets.chomp.to_i
    puts 'Enter a date'
    date = gets.chomp
    new_rental = Rental.new(date, @books[index - 1], @people[person - 1])
    @rentals << new_rental unless @rentals.include?(new_rental)
    puts "\n Rental Created successfully \n\n"
  end

  def all_rentals
    puts "Below are the rentals Records, Insert an ID to filter \n"
    @rentals.each_with_index { |rent, i| puts "\n #{i}. #{rent.book.title} written by #{rent.book.author} \n \n" }
    puts "Here are all users information \n"
    @people.each_with_index { |users, i| puts "\n #{i + 1}. #{users.name} aged #{users.age} with ID: #{users.id} \n\n" }

    puts 'Enter an ID to see all user\'s rentals'
    id = gets.chomp.to_i
    @rentals.select do |user|
      puts "\n #{user.date} #{user.book.title} written by #{user.book.author} \n\n" if user.person.id == id
    end
  end
end
