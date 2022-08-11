require_relative 'rental'
require_relative 'app'

def list_rentals
  puts 'Select id of any person'
  @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
  print 'Person id: '
  person_id = gets.chomp
  @rentals.each do |i|
    puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
  end
  run
end
