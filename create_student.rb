require_relative 'student'
require_relative 'person'
require_relative 'app'
require './data/preserve_data'

def create_student
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]'
  permission = gets.chomp.upcase
  case permission
  when 'Y'
    permission = true
  when 'N'
    permission = false
  end

  student = Student.new(age, name, parent_permission: permission)
  p student
  @people.push(student)
  save_student(age, name, permission)
  puts 'A student created successfully'
end
