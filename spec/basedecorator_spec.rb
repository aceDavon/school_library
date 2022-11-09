require_relative '../base_decorator'
require_relative '../person'

describe 'Decorator' do
  before(:each) do
    @person = Person.new('Troost', 32)
    @decorator = Decorator.new(@person)
  end

  it 'return correct name' do
    expect(@decorator.correct_name).to eql 'Troost'
  end
end
