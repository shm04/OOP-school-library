class Person
  attr_reader :id, :age
  attr_accessor :name

  @@id_counter = 0

  def initialize(name, age, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def generate_id
    @@id_counter += 1
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
