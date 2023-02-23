require 'json'
require 'date'

module PreserveGames
  def save_games(games)
    games_arr = []
    games_path = 'games.json'

    return unless File.exist?(games_path)

    games.map do |game|
      games_arr << { name: game.name, last_played_at: game.last_played_at, publish_date: game.publish_date }
    end

    File.write(games_path, JSON.pretty_generate(games_arr))
  end

  def fetch_games
    data = []
    games_path = 'games.json'

    return data if File.zero?(games_path)

    JSON.parse(File.read(games_path)).each do |game|
      data << Game.new(name: game['name'], last_played_at: game['last_played_at'],
                       publish_date: game['publish_date'])
    end

    data
  end
end
