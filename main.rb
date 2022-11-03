#!/usr/bin/env ruby
require './app'

class Main
  def initialize
    @inst = App.new
  end

  def init
    ['Please choose an option by entering a number',
     '1 - List all books.', '2 - List all people.',
     '3 - Create a person(1 - teacher or 2 - student).',
     '4 - Create a book.', '5 - Create a rental.',
     '6 - List all rentals for a given person id.',
     '7 - Exit'].each do |opt|
      puts opt
    end
    req = gets.chomp
    request(req)
  end

  def request(selection)
    case selection
    when 1
      @inst.all_books
      init
    when '2'
      @inst.all_people
      init
    when '3'
      @inst.create_person
      init
    when '4'
      book
    when '5'
      @inst.create_rental
      init
    when '6'
      @inst.all_rentals
      init
    else
      p 'Thanks for using this app, See you again'
      exit
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
