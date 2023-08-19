require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :rentals

  @teacher_id_counter = 100

  def self.generate_id
    @teacher_id_counter += 1
  end

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def can_use_services?
    true
  end
end
