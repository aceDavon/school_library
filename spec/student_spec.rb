require_relative '../student'
require_relative '../classroom'

describe 'Testing the Student class implementaion' do
  before(:each) do
    @classes = Classroom.new('English Class')
    @student = Student.new(@classes, 'Todd Duran', 34)
    @student.classrooms(@classes)
  end

  it 'return the array length of students in a classroom' do
    expect(@classes.students.length).to be > 0
  end

  it 'return a string from the hooky_play method' do
    expect(@student.play_hooky).not_to eql 'hello'
  end
end
