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


end
