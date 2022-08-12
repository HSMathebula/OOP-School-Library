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
