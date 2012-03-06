require './tiles'
require './player'
require './dungeon'

class Game
  attr_accessor :dungeon, :player, :dungeons

  def initialize
    @player = Player.new
    @dungeons = Array(1..4)
    @moves = 0
    next_dungeon
  end

  def run
    begin
      next_dungeon if @dungeon.complete?
      @dungeon.render
      update
      @moves += 1
      sleep(0.1)
    end until finished?
    puts "FIN! You took #{@moves} moves."
  end

private

  def next_dungeon
    @dungeon = Dungeon.new(player:@player, map_file:"level_#{dungeons.shift}")
  end

  def finished?
    dungeons.empty? && dungeon.complete?
  end

  def update
    player.move
  end

end

Game.new.run
