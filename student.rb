require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, name, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classrooms(classes)
    @classroom = classes
    classes.students.push(self) unless classes.students.include(self)
  end
end
