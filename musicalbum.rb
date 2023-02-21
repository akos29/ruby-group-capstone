class MusicAlbum < Item
  def initialize(publish_date:, on_spotify:)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end