require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date:, publisher:, cover_state:)
    super(publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
end
