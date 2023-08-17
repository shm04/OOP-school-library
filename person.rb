class Person
  attr_reader :id, :age
  attr_accessor :name

  def initialize(id, age, parent_permission: true, name: 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    age? || @parent_permission
  end

  private

  def age?
    @age >= 18
  end
end
