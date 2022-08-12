require './student'

describe Student do
  context 'instantiate student object' do
    student = Student.new(26, 'TEST', parent_permission: true)

    it 'instance of student' do
      expect(student.name).to eq 'TEST'
    end

    it 'if age is correct' do
      expect(student.age).to eq 26
    end

    it 'is parent permmited' do
      expect(student.parent_permission).to eq true
    end
  end
end
