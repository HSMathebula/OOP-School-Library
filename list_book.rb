require_relative 'book'

def list_books
  puts ''
  puts 'List of all the books in the library:'
  puts ''
  if @books.empty?
    puts 'No book added yet.'
    puts 'Please add book.'
  end
  @books.map do |book|
    puts "Title: #{book.title}"
    puts "Author: #{book.author}"
  end
  run
end
