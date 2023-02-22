require './game'

describe Game do
  context 'Test Game class' do
    it 'should create a Game with publish_date, name and last_played_at provided', positive: true do
      game = Game.new publish_date: '2010-05-21', name: 'Fruit Ninja', last_played_at: '2011-05-21'
      expect(game.publish_date).to be_instance_of(Date)
      expect(game).to have_attributes(name: 'Fruit Ninja')
    end
    it 'should return true if parent\'s method returns true OR if last_played_at greater than "2 years".', positive: true do
      game = Game.new publish_date: '2010-05-21', name: 'Fruit Ninja', last_played_at: '2011-05-21'

      res = game.move_to_archive
      expect(res).to be true
    end
    it 'should return false if parent\'s method returns true AND if last_played_at smaller than "2 years".', positive: true do
      game = Game.new publish_date: '2010-05-21', name: 'Fruit Ninja', last_played_at: '2022-05-21'
      res = game.move_to_archive
      expect(res).to be false
    end
    it 'should not create an Game if publish_date, name or last_played_at is not provided', negative: true do
      expect { Game.new publish_date: '01-10-2022' }.to raise_error(ArgumentError)
      expect { Game.new name: 'Fruit Ninja', last_played_at: 'Done' }.to raise_error(ArgumentError)
      expect { Game.new last_played_at: 'Done' }.to raise_error(ArgumentError)
    end
  end
end
