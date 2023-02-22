require_relative 'app'

class Main < App
  def menu
    puts
    puts 'Please choose a number for
    the following options:'
    puts '1 - List all books.'
    puts '2 - List all music albums.'
    puts '3 - List all games.'
    puts '4 - List all genres.'
    puts '5 - List all labels.'
    puts '6 - List all authors.'
    puts '7 - Add a book.'
    puts '8 - Add a music album.'
    puts '9 - Add a game.'
    puts '10 - Exit.'
  end

  def list_methods(choice)
    case choice
    when 1
      list_all_books
    when 2
      list_music_albums
    when 3
      list_all_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    end
  end

  def run
    loop do
      menu
      choice = gets.chomp.to_i
      case choice
      when 1..6
        list_methods(choice)
      when 7
        add_book
      when 8
        add_music_album
      when 9
        add_game
      when 10
        break
      else
        puts 'Invalid input.'
      end
    end
    save_all
  end
end

main = Main.new
main.run
