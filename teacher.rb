require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :rentals

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
