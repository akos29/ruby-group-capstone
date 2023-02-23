require_relative 'item'
require_relative 'book'
require_relative 'game'
require_relative 'author'
require_relative 'label'
require_relative 'preserve_book'
require_relative 'preserve_label'
require_relative 'preserve_game'
require_relative 'preserve_author'
require_relative 'preserve_musicalbums'
require_relative 'preserve_genres'
require_relative 'musicalbum'
require_relative 'genre'

class App
  def initialize
    @genres = fetch_genres
    @labels = fetch_labels
    @authors = fetch_authors
    @games = fetch_games
    @books = fetch_books
    @musicalbums = fetch_musicalbums
  end

  include PreserveBooks
  include PreserveLabels
  include PreserveMusicAlbums
  include PreserveGenres
  include PreserveGames
  include PreserveAuthors
  def list_end_tag
    puts '-' * 100
    accept_input('Press any key to continue ...')
  end

  def list_all_books
    puts '-' * 100
    puts "Publisher\tCover State\t Published Date\t "
    puts '-' * 50
    puts 'There is no Book registered yet.' if @books.empty?
    @books.each do |book|
      puts "#{book.publisher}\t\t#{book.cover_state}\t\t#{book.publish_date}"
    end
  end

  def list_music_albums
    puts '*' * 100
    puts "On Spotify\tPublished Date\tGenre "
    puts '-' * 50
    puts 'There is no Album registered yet.' if @musicalbums.empty?
    @musicalbums.each do |musicalbum|
      puts "#{musicalbum.on_spotify}\t\t#{musicalbum.publish_date}\t\t#{musicalbum.genre.name} "
    end
  end

  def list_all_games
    puts '-' * 100
    puts "Game Name\t\tLast played Date"
    puts '-' * 50
    puts 'There is no Game registered yet.' if @games.empty?
    @games.each do |game|
      puts "#{game.name}\t\t#{game.last_played_at}"
    end
  end

  def list_labels
    add_label if @labels.empty?
    puts "Id\t\tlabel color\t\tlabel title"
    puts '-' * 50
    @labels.each_with_index do |label, index|
      puts "#{index + 1}\t\t#{label.color}\t\t#{label.title}"
    end
  end

  def list_authors
    add_author if @authors.empty?
    puts "Id\t\tFirst Name\t\tLast Name"
    puts '-' * 50
    @authors.each_with_index do |author, index|
      puts "#{index + 1}\t\t#{author.first_name}\t\t#{author.last_name}"
    end
  end

  def list_genres
    puts 'Genres'
    puts '-' * 50
    @genres.each do |genre|
      puts genre.name
    end
  end

  def accept_input(msg)
    puts msg
    gets.chomp
  end

  def add_label
    label_title = accept_input 'Enter label title:'
    label_color = accept_input 'Enter label color:'
    begin
      label = Label.new(title: label_title, color: label_color)
    rescue StandardError
      puts 'Cannot save label'
    else
      @labels.push(label)
      label
    end
  end

  def add_author
    first_name = accept_input 'Enter author\'s first name:'
    last_name = accept_input 'Enter author\'s last name:'
    begin
      author = Author.new(first_name: first_name, last_name: last_name)
    rescue StandardError
      puts 'Cannot save author'
    else
      @authors.push(author)
      author
    end
  end

  def opt_lable
    puts '-' * 50
    choice = accept_input("You can Add NEW(1) or SELECT (2) existing Label\n
      (1) Add new label\n
      (2) Select label \n
      (Anykey) Escape")
    case choice.to_i
    when 1
      label = add_label
    when 2
      list_labels
      label_choice = accept_input('Please enter you choice (Id):').to_i
      label = @labels[label_choice - 1]
    end

    label
  end

  def add_book
    label = opt_lable
    puts '-' * 50
    publisher = accept_input 'Enter Publisher:'
    publish_date = accept_input 'Enter publish date[YYYY-MM-DD]:'
    cover_state = accept_input 'Enter Cover state[good, bad]:'

    book = Book.new(publisher: publisher, publish_date: publish_date, cover_state: cover_state)
    # created association between book and label
    begin
      book.label = label.title
    rescue StandardError
      puts '.'
    end
    # will be selected or created a new genere
    genre = accept_input 'Enter genre[Sic-fi, History ...]:'
    newgenre = Genre.new(name: genre)
    begin
      book.genre = newgenre.name
    rescue StandardError
      puts '.'
    end

    @books.push(book)
  end

  def add_game
    publish_date = accept_input 'Enter publish date [YYYY-MM-DD]:'
    name = accept_input 'Name of the Game:'
    multiplayer = accept_input 'Support multiplayer [True, False]:'
    last_played_at = accept_input 'Last played date [YYYY-MM-DD]:'

    game = Game.new(multiplayer: multiplayer, publish_date: publish_date, last_played_at: last_played_at, name: name)

    @games.push(game)
  end

  def add_music_album
    on_spotify = accept_input 'Enter if it is available on spotify [true, false]:'
    publish_date = accept_input 'Enter publish date[YYYY-MM-DD]:'
    musicalbum = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    genre = accept_input 'Enter genre[Rock, Pop ...]:'
    newgenre = Genre.new(name: genre)
    musicalbum.genre = newgenre
    @musicalbums.push(musicalbum)
    @genres.push(newgenre) unless @genres.include?(newgenre)
  end

  def save_all
    save_books(@books)
    save_labels(@labels)
    save_musicalbums(@musicalbums)
    save_genres(@genres)
    save_authors(@authors)
    save_games(@games)
  end
end
