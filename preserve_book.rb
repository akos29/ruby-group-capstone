require 'json'
require 'date'

module PreserveBooks
  def save_books(books)
    books_arr = []
    books_path = 'books.json'

    return unless File.exist?(books_path)

    books.map do |book|
      books_arr << { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
                     label: book.label, archived: book.archived }
    end

    File.write(books_path, JSON.pretty_generate(books_arr))
  end

  def fetch_books
    data = []
    books_path = 'books.json'

    return data if File.zero?(books_path)

    JSON.parse(File.read(books_path)).each do |book|
      data << Book.new(publisher: book['publisher'], cover_state: book['cover_state'],
                       publish_date: book['publish_date'])
    end

    data
  end
end
