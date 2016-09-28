class Game
  def initialize(options = {})
    @turns = 0
    @players = []
    options[:players].times{ Player.add_to_game(self) }
    @zombie_deck = Deck.generate(:zombies)
    @player_deck = Deck.generate(:items)
  end

  def current_players
    @players.map(&:name)
  end

  def add_player(player)
    @players << player
  end

  def active_player
    @players.first
  end

  def draw_card
    @player_deck.draw!
  end

  def draw_zombie
    @zombie_deck.draw!
  end

  def next_turn
    @players.rotate!
  end

  def inspect
    "Game #{self.object_id}: active player #{active_player.name}\nPlayers #{current_players.inspect}"
  end
end
