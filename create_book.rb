require_relative 'book'
require_relative 'app'
require './data/preserve_data'

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  @books.push(book)
  save_book(title, author)
  puts 'Book created successfully'
  run
end
