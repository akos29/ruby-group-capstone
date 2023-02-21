require './book'

describe Book do
  context 'Test Book class' do
    it 'should create an Book with published date, publisher and cover_state provided', positive: true do
      book = Book.new publish_date: '02-23-2023', publisher: 'Penguin Random House', cover_state: 'Done'
      expect(book.publish_date).to be_instance_of(Date)
      expect(book).to have_attributes(publisher: 'Penguin Random House')
    end
    it 'should return true if parent\'s method returns true OR if cover_state equals to "bad".', positive: true do
      book = Book.new publish_date: '01-10-2000', publisher: 'Penguin Random House', cover_state: 'bad'

      res = book.move_to_archive
      expect(res).to be true
    end
    it 'should return false if parent\'s method returns true AND if cover_state not equals to "bad".', positive: true do
      book = Book.new publish_date: '01-10-2020', publisher: 'Penguin Random House', cover_state: 'Good'
      res = book.move_to_archive
      expect(res).to be false
    end
    it 'should not create an book if published date, publisher or cover_state is not provided', negative: true do
      expect { Book.new publish_date: '01-10-2022' }.to raise_error(ArgumentError)
      expect { Book.new publisher: 'Penguin Random House', cover_state: 'Done' }.to raise_error(ArgumentError)
      expect { Book.new cover_state: 'Done' }.to raise_error(ArgumentError)
    end
  end
end
