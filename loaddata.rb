require 'json'

module Loaddata
  def load_book
    if File.exist?('./data/books.json')
      openbook = File.open('./data/books.json')
      data = openbook.read
      JSON.parse(data)
    else
      File.write('./data/books.json', [])
    end
  end

  def load_person
    if File.exist?('./data/people.json')
      openpeople = File.open('./data/people.json')
      data = openpeople.read
      JSON.parse(data)
    else
      File.write('./data/people.json', [])
    end
  end

  def load_rentals
    if File.exist?('./data/rentals.json')
      openrentals = File.open('./data/rentals.json')
      data = openrentals.read
      JSON.parse(data)
    else
      File.write('./data/rentals.json', [])
    end
  end
end
