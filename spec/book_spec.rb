require_relative '../create_book'
require 'rspec'

describe 'Book' do
  before :each do
    @book = Book.new('title', 'Jane')
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'Title should be title' do
      expect(@book.title).to eql('title')
    end

    it "Author should be Jane" do
      expect(@book.author).to eql('Jane')
    end
  end
end
