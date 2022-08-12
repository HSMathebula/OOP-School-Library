require_relative 'decorate_pattern/nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :age, :name, :rentals

  attr_reader :id
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
