require 'json'

module Database
  def add_to_json(books)
    File.write('./data/books.json', JSON.pretty_generate(books))
  end

  def save_people(people)
    File.write('./data/people.json', JSON.pretty_generate(people))
  end

  def save_rentals(rentals)
    File.write('./data/rentals.json', JSON.pretty_generate(rentals))
  end
end
