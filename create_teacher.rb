require_relative 'teacher'
require_relative 'app'

def create_teacher
  print 'Age: '
  age = gets.chomp.to_i
  print 'Specialization: '
  specialization = gets.chomp
  print 'Name: '
  name = gets.chomp

  teacher = Teacher.new(age, specialization, name)
  @people.push(teacher)
  puts 'Teacher created successfully'
end
