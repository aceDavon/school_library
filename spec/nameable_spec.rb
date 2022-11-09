require_relative './../nameable'

describe 'Testing nameable class implementation' do
  before(:each) do
    @nameable = Nameable.new
  end
  it 'Raise nit implemented error message' do
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
