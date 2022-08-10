require_relative 'app'
require_relative 'create_teacher'
require_relative 'create_student'

def create_person
  puts 'Create a student (1) or a teacher (2)? [Input the number]: '
  answer = gets.chomp.to_i

  case answer
  when 1
    create_student
  when 2
    create_teacher
  end

  run
end
