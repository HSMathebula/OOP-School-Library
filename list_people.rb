require_relative 'person'
require_relative 'create_person'
require_relative 'create_teacher'
require_relative 'create_student'
require_relative 'student'
require_relative 'teacher'
require './data/preserve_data'

def list_people
  puts ''
  puts 'List of all people:'
  if @people.empty?
    puts 'No person recorded yet.'
    return
  end

  @people.each do |person|
    puts "ID: #{person.id}, [#{person.class}] Name: #{person.name}, Age: #{person.age}"
  end
  run
end
