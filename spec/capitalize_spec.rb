require_relative '../capitalize'
require_relative '../person'

describe 'capitilizeDecorator' do
  before(:each) do
    @person = Person.new('Troost', 32)
    @capitilize = CapitalizeDecorator.new(@person)
  end

  it 'return name in uppercase' do
    expect(@capitilize.correct_name).to eql 'TROOST'
  end
end
