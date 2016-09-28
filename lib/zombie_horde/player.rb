class Player
  attr_reader :name, :life, :actions, :hand, :horde

  def self.player_list
    @player_list ||= %w(whiz foxy putt bond dick zits late glue)
  end

  def self.add_to_game(game)
    name = (player_list - game.current_players).sample
    game.add_player new(name, game)
  end

  def initialize(name, game)
    @game = game
    @name = name
    @life = 20
    @actions = 2
    @hand = []
    @horde = []
    @current_step = 0
  end

  def turn_steps
    [
      :draw_zombie,
      :draw_card,
      :take_action,
      :take_damage,
      :finish
    ]
  end

  def next_step
    turn_steps[@current_step]
  end

  def step!(*args)
    self.send(next_step, *args)
    @current_step += 1
    @game.active_player
  end

  def draw_zombie(*args)
    horde << @game.draw_zombie
  end

  def draw_card(*args)
    hand << @game.draw_card
  end

  def take_action(*args)
  end

  def take_damage(*args)
  end

  def finish(*args)
    @game.next_turn
    @current_step = -1
  end

  def inspect
    "#{name} hand: #{hand.inspect} horde: #{horde.inspect} next step: #{next_step}"
  end
end
