require './person'

describe Person do
  context 'Instantiate the person object' do
    person = Person.new(55, 'Test_Name')

    it 'age is correct ?' do
      expect(person.age).to eq 55
    end

    it 'can use services ?' do
      person.can_use_services?.should == true
    end
  end
end
