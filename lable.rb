class Lable
  attr_accessor :title, :color
  
  def initialize(title:,color:)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
  
  def add_item(item:)
    @items.push(item)
  end
end