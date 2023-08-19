require_relative 'person'

class Student < Person
  attr_accessor :classroom, :name, :rentals

  def initialize(name, age, parent_permission)
    super(name, age)
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

