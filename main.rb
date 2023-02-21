require_relative 'app'

class Main < App
  def menu
    puts
    puts 'Please choose a number for
    the following options:'
    puts '1 - List all items.'
    puts '2 - List all labels.'
    puts '3 - List all authors.'
    puts '4 - List all genres.'
    puts '5 - Exit.'
  end

  def run
    loop do
      menu
      case gets.chomp.to_i
      when 1
        list_items
      when 2
        list_labels
      when 3
        list_authors
      when 4
        list_genres
      when 5
        break
      else
        puts 'Invalid input.'
      end
    end
  end
end

main = Main.new
main.run
