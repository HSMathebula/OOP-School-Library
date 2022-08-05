require_relative 'book'
require_relative 'student'
require_relative 'teacher'
class App
  attr_reader :people

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
    puts '6 -  List all rentals for a given person id'
    puts '7 - Exit'
  end

  def option_checker(answer)
    case answer
    when 1
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

  def list_books
    puts 'List of all the books in the library:'
    @books.each do |book|
      puts "Title: '#{book.title}', Author: '#{book.author}'"
    end
    run
  end

  def list_people
    puts 'List of all people:'
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    run
  end
end
