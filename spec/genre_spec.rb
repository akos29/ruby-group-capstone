require './genre'
require './musicalbum'

describe Genre do
  context 'Testing genre class' do
    it 'should create a genre if name provided', positive: true do
      genre = Genre.new name: 'Abc'

      expect(genre).to have_attributes(name: 'Abc')
      expect(genre).to have_attributes(items: [])
    end
    it 'add an item to a genre (add_item method)', positive: true do
      genre = Genre.new name: 'Abc'
      newalbum = MusicAlbum.new(publish_date: '2-21-2023', on_spotify: true)
      genre.add_item item: newalbum
      expect(genre).to have_attributes(items: [newalbum])
    end

    it 'should not create genre without name', negative: true do
      expect { Genre.new }.to raise_error(ArgumentError)
    end
  end
end
