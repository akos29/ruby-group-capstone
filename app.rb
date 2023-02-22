require_relative 'item'
require_relative 'book'
require_relative 'author'
require_relative 'label'

class App
  def initialize
    @items = []
    @labels = []
    @authors = []
    @genres = []
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "#{book.publisher} -- #{book.cover_state} "
    end
  end

  def list_items
    @items.each do |item|
      puts item
    end
  end

  def list_labels
    @labels.each do |label|
      puts label
    end
  end

  def list_authors
    @authors.each do |author|
      puts author
    end
  end

  def list_genres
    @genres.each do |genre|
      puts genre
    end
  end

  def accept_input(msg)
    puts msg
    gets.chomp
  end

  def add_book
    publisher = accept_input 'Enter Publisher:'
    publish_date = accept_input 'Enter publish date[MM-DD-YYYY]:'
    cover_state = accept_input 'Enter Cover state[good, bad]:'
    book = Book.new(publisher: publisher, publish_date: publish_date, cover_state: cover_state)

    genre = accept_input 'Enter genre[Comedy, Thriller ...]:'
    book.add_genre = genre

    author = accept_input 'Enter authors:'
    book.add_author = author
    label_title = accept_input 'Enter label title:'
    label_color = accept_input 'Enter label color:'
    label = Label.new(title: label_title, color: label_color)

    book.label = label

    @books.push(book)
  end
end
