require 'json'

module Database
  def add_to_json(books)
    File.write('./data/books.json', JSON.generate(books))
  end

  def save_people(people)
    File.write('./data/people.json', JSON.generate(people))
  end

  def save_rentals(rentals)
    File.write('./data/rentals.json', JSON.generate(rentals))
  end
  
end