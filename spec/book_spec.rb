require './book'

describe Book do
  context 'Test Book class' do
    it 'should create an Book with published date, publisher and cover_state provided', positive: true do
      book = Book.new publish_date: '2023/02/23', publisher: 'Penguin Random House', cover_state: 'Done'
      expect(book.publish_date).to be_instance_of(Date)
      expect(book).to have_attributes(publisher: 'Penguin Random House')
    end
    it 'should archive book if published date is older than 10 years', positive: true do
      book = Book.new publish_date: '2000/10/01', publisher: 'Penguin Random House', cover_state: 'Done'

      book.move_to_archive
      expect(book).to have_attributes(archived: true)
    end
    it 'should archive book if published date is older than 10 years', positive: true do
      book = Book.new publish_date: '2022/10/01', publisher: 'Penguin Random House', cover_state: 'Done'
      book.move_to_archive
      expect(book).to have_attributes(archived: false)
    end
    it 'should not create an book if published date, publisher or cover_state is not provided', negative: true do
      expect { Book.new publish_date: '2022/10/01' }.to raise_error(ArgumentError)
      expect { Book.new publisher: 'Penguin Random House', cover_state: 'Done' }.to raise_error(ArgumentError)
      expect { Book.new cover_state: 'Done' }.to raise_error(ArgumentError)
    end
  end
end
