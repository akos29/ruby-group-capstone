require './source'
require './item'

describe Source do
  context 'Testing source class' do
    it 'should create a Source if name provided', positive: true do
      source = Source.new name: 'Abc'

      expect(source).to have_attributes(name: 'Abc')
      expect(source).to have_attributes(items: [])
    end
    it 'add an item to a source (add_item method)', positive: true do
      source = Source.new name: 'Abc'

      source.add_item item: 'The Artist'
      expect(source).to have_attributes(items: ['The Artist'])
    end

    it 'should not create source without name', negative: true do
      expect { Source.new }.to raise_error(ArgumentError)
    end
  end
end
