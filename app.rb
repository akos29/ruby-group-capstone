require_relative 'item'
require_relative 'book'
require_relative 'author'
require_relative 'label'
require_relative 'preserve_book'
require_relative 'preserve_label'

class App
  def initialize
    @items = []
    @labels = []
    @authors = []
    @genres = []
    @books = fetch_books
  end

  include PreserveBooks
  include PreserveLabels
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

  def add_label
    label_title = accept_input 'Enter label title:'
    label_color = accept_input 'Enter label color:'
    label = Label.new(title: label_title, color: label_color)
    @labels.push(label)
    label
  end

  def add_book
    choice = accept_input("You can Add NEW(1) or SELECT (2) existing Label\n
      (1) Add new label\n
      (2) Select label ")

    case choice.to_i
    when 1
      label = add_label
    when 2
      label = list_labels
    end

    publisher = accept_input 'Enter Publisher:'
    publish_date = accept_input 'Enter publish date[YYYY-MM-DD]:'
    cover_state = accept_input 'Enter Cover state[good, bad]:'

    book = Book.new(publisher: publisher, publish_date: publish_date, cover_state: cover_state)
    # created association between book and label
    book.label = label

    # will be selected or created a new genere
    genre = accept_input 'Enter genre[Comedy, Thriller ...]:'
    book.add_genre = genre
    # will be selected or created a new author
    author = accept_input 'Enter authors:'
    book.add_author = author

    @books.push(book)
  end

  def save_all
    save_books(@books)
    save_labels(@labels)
  end
end
