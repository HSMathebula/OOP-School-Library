require_relative 'app'

def main
  puts ''
  app = App.new
  app.load_data
  app.run
end

main
