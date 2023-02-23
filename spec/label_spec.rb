require './label'
require './item'

describe Label do
  context 'Testing label class' do
    it 'create a label with Title and color', positive: true do
      label = Label.new id: 2, title: 'Gift', color: 'Black'

      expect(label).to have_attributes(id: 2)
      expect(label).to have_attributes(title: 'Gift')
      expect(label).to have_attributes(color: 'Black')
    end
    it 'add an item to a Label and association with Item (1 to N)', positive: true do
      label = Label.new title: 'Abc', color: 'good'
      item = Item.new publish_date: '2000-2-1'

      label.add_item = item
      expect(label.items[0]).to be_instance_of(Item)
      expect(item.label).to be_instance_of(Label)
    end

    it 'should not create label without Title or color', negative: true do
      expect { Label.new 'Color' }.to raise_error(ArgumentError)
    end
  end
end
