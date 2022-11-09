require_relative '../classroom'
require_relative '../student'

describe 'Testing the Classroom implementation' do
  before(:each) do
    @classes = Classroom.new('English Class')
    @student = Student.new(@classes, 'Todd Duran', 34)
    @classes.add_student(@student)
  end

  it 'Return the instance of the classroom implementation' do
    expect(@classes).to be_instance_of Classroom
  end

  it 'Return the Label string from the class instance' do
    expect(@classes.label).to eql 'English Class'
  end

  it 'Return the array length of students from the class implementation' do
    expect(@classes.students.length).to be > 0
  end
end
