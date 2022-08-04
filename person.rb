require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
  public :can_use_services?

  def correct_name
    @name
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

person = Person.new(28, 'happen')
p person.can_use_services?
