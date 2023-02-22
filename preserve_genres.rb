require 'json'

module PreserveGenres
  def fetch_genres
    genres_array = []
    genres_file = 'genres.json'
    return genres_array if !File.exist?(genres_file) || File.read(genres_file) == ''

    json_genres = File.read('genres.json')
    data_genres = JSON.parse(json_genres)
    class_genres = data_genres.map { |genre| Genre.new(genre['name']) }
    class_genres.map { |genre| genres_array.push(genre) }
    genres_array
  end

  def save_genres(genres)
    genres_array = []
    genres.each { |genre| genres_array.push({ name: genre.name }) }
    File.write('genres.json', JSON.generate(genres_array))
  end
end