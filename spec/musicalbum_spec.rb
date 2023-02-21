require_relative '../musicalbum'
require_relative '../genre'

describe '#constructor' do
  it 'create instance' do
    newalbum = MusicAlbum.new(publish_date: '2-21-2023', on_spotify: true)
    expect(newalbum).to be_instance_of(MusicAlbum)
  end

describe '#can_be_archived?' do
  context 'on Spotify and publish date < 10 years' do
    newalbum = MusicAlbum.new(publish_date: '2-21-2023', on_spotify: true)
    it 'returns false' do
      result = newalbum.send(:can_be_archived?)
      expect(result).to be false
    end
  end

  context 'on Spotify and publish date > 10 years' do
    newalbum = MusicAlbum.new(publish_date: '2-21-2012', on_spotify: true)
    it 'returns true' do
      result = newalbum.send(:can_be_archived?)
      expect(result).to be true
    end
  end

  context 'not in  Spotify and publish date > 10 years' do
    newalbum = MusicAlbum.new(publish_date: '2-21-2012', on_spotify: false)
    it 'returns false' do
      result = newalbum.send(:can_be_archived?)
      expect(result).to be false
    end
  end

  context 'not in  Spotify and publish date < 10 years' do
    newalbum = MusicAlbum.new(publish_date: '2-21-2018', on_spotify: false)
    it 'returns false' do
      result = newalbum.send(:can_be_archived?)
      expect(result).to be false
    end
  end
end 
end
