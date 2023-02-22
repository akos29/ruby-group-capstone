require './musicalbum'

class Genre
  attr_accessor :name, :items

  def initialize(name:)
    @name = name
    @items = []
  end

  def add_item(item:)
    @items.push(item)
    item.genre = self
  end
end
