require 'json'

module PreserveGenres
  def fetch_genres
    genres_array = []
    genres_file = 'genres.json'

    return genres_array if File.zero?(genres_file)

    JSON.parse(File.read(genres_file)).each do |genre|
      genres_array << Genre.new(name: genre['name'])
    end

    genres_array
  end

  def save_genres(genres)
    genres_array = []
    genres.each { |genre| genres_array.push({ name: genre.name }) }
    File.write('genres.json', JSON.generate(genres_array))
  end
end
