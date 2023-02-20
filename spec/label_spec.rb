require './label'
require './item'

describe Label do
  context 'Testing label class' do
    it 'create a label with Title and color', positive: true do
      label = Label.new title: 'Abc', color: 'Black'

      expect(label).to have_attributes(title: 'Abc')
      expect(label).to have_attributes(color: 'Black')
    end
    it 'add an item to a label (add_item method)', positive: true do
      label = Label.new title: 'Abc', color: 'Black'

      label.add_item item: 'The Artist'
      expect(label).to have_attributes(items: ['The Artist'])
    end

    it 'should not create label without Title or color', negative: true do
      expect { Label.new 'Color' }.to raise_error(ArgumentError)
    end
  end
end
