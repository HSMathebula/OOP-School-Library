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

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    run
  end

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
    puts 'Rental created successfully'
    run
  end

  def list_books
    puts ''
    puts 'List of all the books in the library:'
    puts ''
    @books.each do |book|
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
    end
    run
  end

  def list_people
    puts ''
    puts 'List of all people:'
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    run
  end

  def list_rentals
    print 'ID of person; '
    id = gets.chomp.to_i
    rentals = @rentals.select { |rental| id == rental.person.id }

    rentals.each { |item| puts "Date: #{item.date},  Book #{item.book.title}, by #{item.book.author}" }
    run
  end
end
