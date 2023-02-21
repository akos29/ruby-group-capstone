require './genre'
require './item'

describe Genre do
  context 'Testing genre class' do
    it 'should create a genre if name provided', positive: true do
      genre = Genre.new name: 'Abc'

      expect(genre).to have_attributes(name: 'Abc')
      expect(genre).to have_attributes(items: [])
    end
    # it 'add an item to a genre (add_item method)', positive: true do
    #   genre = Genre.new name: 'Abc'

    #   genre.add_item item: 'The Artist'
    #   expect(genre).to have_attributes(items: ['The Artist'])
    # end

    it 'should not create genre without name', negative: true do
      expect { Genre.new }.to raise_error(ArgumentError)
    end
  end
end
