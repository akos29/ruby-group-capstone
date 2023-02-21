require_relative 'item'

class App 
  def initialize
    @items = []
    @labels = []
    @authors = []
    @genres = []
  end

  def list_items
    @items.each do |item|
      puts item
    end  
  end

  def list_labels
    @labels.each do |label|
      puts label
    end
  end

  def list_authors
    @authors.each do |author|
      puts author
    end
  end

  def list_genres
    @genres.each do |genre|
      puts genre
    end
  end
end