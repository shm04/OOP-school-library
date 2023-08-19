class Person
  attr_reader :id, :age
  attr_accessor :name

  def initialize(name, age, parent_permission: true)
    @id = self.class.generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def self.generate_id
    @id_counter ||= 0
    @id_counter += 1
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
