require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(name, age, parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    true if is_of_age? or @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    true if age >= 18
  end

  def add_rentals(rental)
    @rental.push(rental)
    rental.person = self
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
