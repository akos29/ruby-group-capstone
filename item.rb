class Item
  attr_reader :label, :publish_date

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
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
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    true
  end
end
