require './teacher'

describe Teacher do
  context 'Instantiate teacher' do
    teacher = Teacher.new(45, 'Maths', 'TEST')
    
    it 'Age is correct' do
      expect(teacher.age).to eq 45
    end

    it 'Is name TEST' do
      expect(teacher.name).to eq 'TEST'
    end

    it 'specialization is correct' do
      expect(teacher.specialization).to eq 'Maths'
    end
  end
end
