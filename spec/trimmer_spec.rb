require_relative '../trimmer'
require_relative '../person'

describe 'TrimmerDecorator' do
  before(:each) do
    @person = Person.new('Troost saphire', 32)
    @trimmer = TrimmerDecorator.new(@person)
  end

  it 'return name trimmed' do
    expect(@trimmer.correct_name).to eql 'Troost sap'
  end
end
