require './book'
require './rental'

describe Book do
  context 'Instantiate the book object' do
    book = Book.new 'test_title', 'test_author'

    it 'print the book title' do
      expect(book.title).to eq 'test_title'
    end

    it 'print the book author' do
      expect(book.author).to eq 'test_author'
    end
  end
end
