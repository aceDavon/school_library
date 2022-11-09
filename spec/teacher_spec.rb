require_relative '../teacher'

describe 'Testing the Teacher class implementation' do
  before(:each) do
    @teacher = Teacher.new('Fiction', 'Tony Brooks', 40)
  end

  describe 'Test the Teacher instance methods implementations' do
    it 'Return the Name from the Teacher instance' do
      expect(@teacher.name).to include('Tony')
    end

    it 'Check the Teacher can_use method to be truthy' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end
end
