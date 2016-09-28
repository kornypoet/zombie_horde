class Deck
  def self.generate(card_type)
    self.new populate_list(card_type)
  end

  def self.populate_list(card_type)
    JSON.parse File.read(data_file(card_type))
  end

  def self.data_file(name)
    File.expand_path("../../../data/#{name}.json", __FILE__)
  end

  def initialize(card_list)
    @card_list = card_list
  end

  def draw!
    @card_list.pop
  end
end
