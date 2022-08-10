require_relative 'book'
require_relative 'app'

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  book = Book.new(title, author)
  @books.push(book)
  puts 'Book created successfully'
  run
end
