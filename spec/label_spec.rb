require './label'

describe Label do
  context 'Testing label class' do
    it 'create a label with Title and color', positive: true do
      label = Label.new title: 'Abc', color: 'Black'

      expect(label).to have_attributes(title: 'Abc')
      expect(label).to have_attributes(color: 'Black')
    end

    it 'should not create label without Title or color', negative: true do
      expect { Label.new 'Color' }.to raise_error(ArgumentError)
    end
  end
end
