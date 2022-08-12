require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require 'json'

def load_books
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if File.empty?('./data/books.json')
      'Please add some books first if this is your fist time using our app'
    else
      books = JSON.parse(File.read('./data/books.json'))
      books.each do |book|
        book = Book.new(book['title'], book['author'])
        @books << book
      end
    end
    file.close
  else
    puts 'File empty. add new book.'
  end
  puts 'Available books:'
  @books.each { |b| puts "Book title: #{b.title}, Author: #{b.author}" } unless @books.empty?
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      book = [obj]
    else
      book = JSON.parse(File.read('./data/books.json'))
      book << obj
    end

    file.close

    myfile = File.open('./data/books.json', 'w')
    myfile.write(JSON.pretty_generate(book))
    myfile.close

  else
    puts 'File empty. add new book.'
  end
end

def load_people
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')
    if File.empty?('./data/people.json')
      puts 'Please add people data if this is your first time visiting our app'
    else
      people = JSON.parse(File.read('./data/people.json'))
      people.each do |person|
        if person['answer'] == 'Student'
          student = Student.new(person['age'], person['name'])
          @people << student
        else
          teacher = Teacher.new(person['age'], person['specialization'], person['name'])
          @people << teacher
        end
      end
    end
    file.close
  else
    puts 'File empty. Please insert some data.'
  end
end

def save_student(age, name, parent_permission)
  obj = {
    type: 'Student',
    name: name,
    age: age,
    parent_permission: parent_permission
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      student = [obj]
    else
      student = JSON.parse(File.read('./data/people.json'))
      student << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(student))
    myfile.close

  else
    puts 'no file'
  end
end

def save_teacher(age, specialization, name)
  obj = {
    type: 'Teacher',
    specialization: specialization,
    name: name,
    age: age,
    parent_permission: true
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      teacher = [obj]
    else
      teacher = JSON.parse(File.read('./data/people.json'))
      teacher << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(teacher))
    myfile.close

  else
    puts 'no file'
  end
end

def load_rentals
  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if File.empty?('./data/rentals.json')
      puts 'Please add reseve some books first'
    else
      rentals = JSON.parse(File.read('./data/rentals.json'))
      puts 'Reserved books: '
      rentals.each do |rental|
        puts "Name: #{rental['person']}, Book: #{rental['book']} on: #{rental['date']}"
      end
    end
    file.close
  else
    puts 'No reservations found, please reseve some books first'
  end
end

def save_rental(date, book, person)
  obj = {
    date: date,
    person: person.name,
    book: book.title
  }

  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      rental = [obj]
    else
      rental = JSON.parse(File.read('./data/rentals.json'))
      rental << obj
    end

    file.close

    myfile = File.open('./data/rentals.json', 'w')
    myfile.write(JSON.pretty_generate(rental))
    myfile.close

  else
    puts 'no file'
  end
end
