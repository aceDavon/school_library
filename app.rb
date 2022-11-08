require './book'
require './teacher'
require './rental'
require './student'
require './database'
require './loaddata'
require 'json'

class App
  include Database
  include Loaddata
  def initialize
    @books = load_book
    @people = load_person
    @rentals = load_rentals
  end

  def all_books
    @books = load_book
    if @books.empty?
      puts "There are no books created yet, Add some books to see them here :( \n\n"
    else
      @books.each { |bk| puts "\n Title: #{bk["title"]} by #{bk["author"]} \n \n" }
    end
  end


  def all_people
    @people = load_person
    if @people.empty?
      puts "There are no persons created yet, Add users to see them here :( \n\n"
    else
      @people.each { |peeps| puts "\n Name: #{peeps["name"]}, Age: #{peeps["age"]} years old \n\n" }
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
      @people << {
        id: new_person.id,
        type: new_person.class,
        name: new_person.name,
        age: new_person.age
      }
      puts "\n User #{name} added successfully \n\n"
      save_people(@people)
    when '2'
      puts 'Enter Student Name'
      name = gets.chomp
      puts 'What\'s your age?'
      age = gets.chomp
      puts 'What Class (Classes incluse 3b, 4a, 6c)?'
      classes = gets.chomp
      permission?
      new_student = Student.new(classes, name, age)
      @people << {
        id: new_student.id,
        type: new_student.class,
        name: new_student.name,
        age: new_student.age
      }
      puts "\n Student #{name} aged #{age} added successfully \n\n"
      save_people(@people)
    end
  end


  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << { title: new_book.title, author: new_book.author } 
    puts "\n Book #{title} by #{author} created successfully \n\n"
    add_to_json(@books)
  end

  # def add_to_json(books)
  #   me = []
  #   books.each do |s|
  #     me << {"book title" => s.title, "author" => s.author}
  #   end
  #   File.write('me.json', JSON.generate(me))
  # end

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
    @books.each_with_index { |bk, i| puts "\n #{i + 1}. #{bk["title"]} by #{bk["author"]}  \n\n" }
    index = gets.chomp.to_i
    puts 'Who is renting this book?'
    @people.each_with_index { |bk, i| puts "#{i + 1} #{bk["name"]} aged #{bk["age"]}" }
    person = gets.chomp.to_i
    puts 'Enter a date'
    puts  @books[index - 1]
    date = gets.chomp
    new_rental = Rental.new(date, @books[index - 1], @people[person - 1])
    @rentals << {
      date: new_rental.date,
      person_id: new_rental.person['id'],
      person_name: new_rental.person['name'],
      title: new_rental.book["title"],
      author: new_rental.book["author"]
    }
    puts "\n Rental Created successfully \n\n"
    save_rentals(@rentals)
  end

  def all_rentals
    @rentals = load_rentals
    puts "Below are the rentals Records, Insert an ID to filter \n"
    @rentals.each_with_index { |rent, i| puts "\n #{i}. #{rent["title"]} written by #{rent["author"]} \n \n" }
    puts "Here are all users information \n"
    @people.each_with_index { |users, i| puts "\n #{i + 1}. #{users["name"]} aged #{users["age"]} with ID: #{users["id"]} \n\n" }

    puts 'Enter an ID to see all user\'s rentals'
    id = gets.chomp.to_i
    @rentals.select do |user|
      puts "\n #{user["date"]} #{user["title"]} written by #{user["author"]} \n\n" if user["person_id"] == id
    end
  end
end
