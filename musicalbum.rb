class MusicAlbum < Item
  def initialize(publish_date:, on_spotify:)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end
end