require_relative 'person'

class Student < Person
  attr_accessor :classroom, :name, :rentals

  @teacher_id_counter = 0

  def self.generate_id
    @teacher_id_counter += 1
  end

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
