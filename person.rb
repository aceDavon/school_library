class Person
  def initialize(_name, age, parent_permission: true)
    @id = Random.rand(1...1000)
    @age = age
    @name = 'unknown'
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    true if is_of_age? or @parent_permission
  end

  private

  def of_age?
    true if age >= 18
  end
end
