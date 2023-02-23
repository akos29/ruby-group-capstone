require 'json'

module PreserveMusicAlbums
  def fetch_musicalbums
    musicalbums_array = []
    musicalbums_file = 'musicalbums.json'
    return musicalbums_array if !File.exist?(musicalbums_file) || File.read(musicalbums_file) == ''

    json_musicalbums = File.read('musicalbums.json')
    data_musicalbums = JSON.parse(json_musicalbums)
    class_musicalbums = data_musicalbums.map do |musicalbum|
      newalbum = MusicAlbum.new(publish_date: musicalbum['publish_date'], on_spotify: musicalbum['on_spotify'])
      newalbum.genre = Genre.new(name: musicalbum['genre'])
      newalbum
    end
    class_musicalbums.map { |musicalbum| musicalbums_array.push(musicalbum) }
    musicalbums_array
  end

  def save_musicalbums(musicalbums)
    musicalbums_array = []
    musicalbums.each do |musicalbum|
      musicalbums_array.push({ publish_date: musicalbum.publish_date, on_spotify: musicalbum.on_spotify,
                               genre: musicalbum.genre.name })
    end
    File.write('musicalbums.json', JSON.generate(musicalbums_array))
  end
end
