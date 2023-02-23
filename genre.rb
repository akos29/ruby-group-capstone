require './musicalbum'
require './item'

class Genre
  attr_accessor :name, :items

  def initialize(name:)
    @name = name
    @items = []
  end

  def add_item=(item)
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
