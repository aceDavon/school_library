class Person
  def initialize(name, age, parent_permission = true)
    @id = Random.rand(1...1000)
    @age = age
    @name = "unknown"
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  private def is_of_age?
    if(age >= 18)
      true
    elsif
      false
    end
  end

  def can_use_services?
    if(is_of_age? or @parent_permission)
      true
    end
  end
end