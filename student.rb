require './Person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super(name, age, parent_permission)
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
