require './author'
require './item'

describe Author do
  context 'Testing author class' do
    it 'create a author with first_name and last_name', positive: true do
      author = Author.new id: 2, first_name: 'John', last_name: 'Doe'

      expect(author).to have_attributes(id: 2)
      expect(author).to have_attributes(first_name: 'John')
      expect(author).to have_attributes(last_name: 'Doe')
    end
    it 'add an item to a Author and association with Item (1 to N)', positive: true do
      author = Author.new first_name: 'John', last_name: 'Doe'
      item = Item.new publish_date: '2000-10-01'

      author.add_item = item
      expect(author.items[0]).to be_instance_of(Item)
    end

    it 'should not create author without first_name or last_name', negative: true do
      expect { Author.new 'last_name' }.to raise_error(ArgumentError)
    end
  end
end
