require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'app'

def create_rental
  puts 'Select the book from the following list by number (not ID)'
  @books.each_with_index do |book, idx|
    puts "#{idx}) Title: '#{book.title}', Author: '#{book.author}'"
  end
  selected_id_book = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp

  puts 'Select a person from the following list by number (not ID)'
  @people.each_with_index do |person, idx|
    puts "#{idx}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  selected_id_person = gets.chomp.to_i

  rental = Rental.new(date, @books[selected_id_book], @people[selected_id_person])
  @rentals.push(rental)
  save_rental(date, @books[selected_id_book], @people[selected_id_person])
  puts 'Rental created successfully'
  run
end
