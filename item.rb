require './label'
require 'date'

class Item
  attr_reader :label, :publish_date, :archived

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.strptime(publish_date, '%m-%d-%Y')
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    ((Date.today << 120) <=> @publish_date).positive?
  end
end
