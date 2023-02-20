require './label'
require 'date'

class Item
  attr_reader :label, :publish_date, :archived
  
  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse publish_date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
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
    p current_date = Time.now.utc.to_date
    p res = current_date.year - (@publish_date).year
    if res > 10
      true
    else
      false
    end
  end
end
