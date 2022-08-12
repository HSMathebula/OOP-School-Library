require './classroom'

describe Classroom do
  context 'Instantiate the Classroom object' do
    classroom = Classroom.new 'A'

    it 'print the classroom label' do
      expect(classroom.label).to eq 'A'
    end
  end
end
