#!/usr/bin/env ruby
require './init'

class Main
  def initialize
    Init.new
  end

  # def book
  #   p 'Enter title: '
  #   title = gets.chomp
  #   p 'Enter Author: '
  #   author = gets.chomp
  #   @inst.create_book(title, author)
  #   init
  # end
end

Main.new
