require './student'
require './book'
require './rental'

describe Rental do
  context 'instantiate rental' do
    book = Book.new('TEST', 'TEST')
    student = Student.new(23, 'TEST', parent_permission: true)
    rental = Rental.new('2022-02-02', book, student)

    it 'instance of Rental class' do
      rental.should be_an_instance_of Rental
    end

    it 'date is correct' do
      rental.date.should eql '2022-02-02'
    end
  end
end
