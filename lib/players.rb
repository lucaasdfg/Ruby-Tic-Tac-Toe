# frozen_string_literal: true

class Players
  attr_writer :players
  attr_reader :players
  def initialize
    @players = []
  end

  def toset_player(player)
    @players << player
  end
end
