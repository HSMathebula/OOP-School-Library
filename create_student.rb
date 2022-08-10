require_relative 'student'
require_relative 'app'

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

  student = Student.new(age, nil, name, parent_permission: permission)
  @people.push(student)
  puts 'A student created successfully'
end
