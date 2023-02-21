require './item'

class Author
  attr_accessor :name, :books

  def initialize(name:)
    @id = Random.rand(1..1000)
    @name = name
    @books = []
  end

  def add_book(book:)
    @books.push(book)
    # book.label = self
  end
end