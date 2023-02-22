require 'date'
require './item'

class Game < Item
  attr_accessor :last_played_at, :name

  def initialize(name:, publish_date:, last_played_at:, multiplayer: false)
    super(publish_date: publish_date)
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
    @name = name
    @multiplayer = multiplayer
  end
  
  def move_to_archive
    can_be_archived? && super
  end

  private

  def can_be_archived?
    Date.today.year - @last_played_at.year > 2
  end
end
