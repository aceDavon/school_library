require_relative '../person'

describe 'Test the Person class Implementation' do
  before(:each) do
    @person = Person.new('Troost', 32)
  end

  describe 'Return Name from the person class Instance' do
    it 'returns the name on the class instance' do
      expect(@person.name).to eql 'Troost'
    end
  end

  describe 'Return Age from the person class Instance' do
    it 'returns the age on the class instance' do
      expect(@person.age).not_to eql 20
    end
  end

  describe 'Return the class instance from the person class Instance' do
    it 'returns the age on the class instance' do
      expect(@person).to be_instance_of Person
    end
  end
end
