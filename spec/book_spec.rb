require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe 'Test the Book class Implementation' do
  before(:each) do
    @book = Book.new('Lord of the Flies', 'Martin G')
    @person = Person.new('Troost', 32)
    @rentals = Rental.new('02/02/2090', @book, @person)
    @book.add_rentals(@rentals)
  end

  describe 'Return length of rentals array on class Instance' do
    it 'returns the rentals array length on the class instance' do
      expect(@book.rentals.length).to be > 0
    end
  end

  describe 'Return title from the book class Instance' do
    it 'returns the title of the book instance' do
      expect(@book.title).not_to eql 'Gangsters of London'
    end
  end

  describe 'Return the class instance from the person class Instance' do
    it 'returns the class instance' do
      expect(@book).to be_instance_of Book
    end
  end
end
