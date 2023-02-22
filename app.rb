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
    list_end_tag
  end

  def list_music_albums
    puts '*' * 100
    puts "On Spotify\tGenre\t Published Date\t "
    puts '-' * 50
    puts 'There is no Album registered yet.' if @musicalbums.empty?
    @musicalbums.each do |musicalbum|
      puts "#{musicalbum.on_spotify} -- #{musicalbum.genre} -- #{musicalbum.publish_date} "
    end
    list_end_tag
  end

  def list_all_games
    puts '-' * 100
    puts "Game Name}\t\tLast played Date}"
    puts '-' * 50
    puts 'There is no Game registered yet.' if @games.empty?
    @games.each do |game|
      puts "#{game.name}\t\t#{game.last_played_at}"
    end
    list_end_tag
  end

  def list_labels
    add_label if @labels.empty?
    puts "index\t\tlabel color\t\tlabel title"
    puts '-' * 50
    index = 0
    @labels.each do |label|
      puts "#{index + 1}\t\t#{label.color}\t\t#{label.title}"
    end
    list_end_tag
  end

  def list_authors
    @authors.each do |author|
      puts author
    end
    list_end_tag
  end

  def list_genres
    @genres.each do |genre|
      puts genre
    end
    list_end_tag
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
      # p 'Cannot save label'
    else
      @labels.push(label)
      label
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
      label = list_labels
    end
    puts '-' * 50

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
    #   begin
    book.label = label
    #   rescue StandardError => e
    #     p "cannot add label. Error: #{e}"
    #   else
    #     p '.' * 50
    #   end
    #   # will be selected or created a new genere
    genre = accept_input 'Enter genre[Comedy, Thriller ...]:'
    #   begin
    book.add_genre = genre
    #   rescue StandardError => e
    #     p "cannot add genre. Error: #{e}"
    #   else
    #     p '.' * 50
    #   end

    #   # will be selected or created a new author
    author = accept_input 'Enter authors:'
    #   begin
    book.add_author = author
    #   rescue StandardError => e
    #     p "cannot add gener. Error: #{e}"
    #   else
    #     p '.' * 50
    #   end
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
    musicalbum.genre = genre
    @genres.push(Genre.new(name: genre)) unless @genres.include?(genre)
    @musicalbums.push(musicalbum)
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
