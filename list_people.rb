require_relative 'person'

def list_people
  puts ''
  puts 'List of all people:'
  @people.each do |person|
    puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  run
end
