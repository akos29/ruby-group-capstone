require './genre'
require './item'

describe Genre do
  context 'Testing genre class' do
    it 'should create a genre if name provided', positive: true do
      genre = Genre.new name: 'Abc'

      expect(genre).to have_attributes(name: 'Abc')
      expect(genre).to have_attributes(items: [])
    end
    it 'add an item to a genre (add_item method)', positive: true do
      genre = Genre.new name: 'Abc'
      newitem = Item.new(publish_date: '2023-1-21')
      genre.add_item = newitem
      expect(genre).to have_attributes(items: [newitem])
    end
    it 'add a genre to an item (add_item method)', positive: true do
      newgenre = Genre.new name: 'Abc'
      newitem = Item.new(publish_date: '2023-1-21')
      newgenre.add_item = newitem
      expect(newitem.genre).to eq newgenre
    end

    it 'should not create genre without name', negative: true do
      expect { Genre.new }.to raise_error(ArgumentError)
    end
  end
end
