require './item'
require 'date'

describe Item do
  context 'Test Item class' do
    it 'should create an Item with published date provided', positive: true do
      item = Item.new publish_date: '2-3-2023'
      expect(item.publish_date).to be_instance_of(Date)
      expect(item).to have_attributes(archived: false)
    end
    it 'should archive item if published date is older than 10 years', positive: true do
      item = Item.new publish_date: '1-10-2000'
      item.move_to_archive
      expect(item).to have_attributes(archived: true)
    end
    it 'should archive item if published date is older than 10 years', positive: true do
      item = Item.new publish_date: '1-10-2022'
      item.move_to_archive
      expect(item).to have_attributes(archived: false)
    end
    it 'should not create an Item if published date is not provided', negative: true do
      expect { Item.new }.to raise_error(ArgumentError)
    end
  end
end
