require_relative 'create_person'
require_relative 'create_rental'
require_relative 'create_book'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'list_book'
require_relative 'list_people'
require_relative 'list_rentals'
require_relative 'create_teacher'
require_relative 'create_student'
require 'date'
require_relative './data/preserve_data'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print 'Enter Option: '
  end

  def option_checker(answer)
    case answer
    when 1
      system('cls')
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    else
      puts 'Wrong input!'
      run
    end
  end

  def run
    menu
    answer = gets.chomp.to_i
    exit if answer == 7
    option_checker(answer)
  end

  def load_data
    load_people
    puts
    load_books
    puts
    load_rentals
  end

  def convert_date(str)
    Date.parse(str)
  end
end
