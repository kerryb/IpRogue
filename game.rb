require './tiles'
require './player'
require './dungeon'

class Game
  attr_accessor :dungeon, :player
  
  def initialize
    @player = Player.new
    @dungeon = Dungeon.new(player:@player)
  end

  def run
    begin
      @dungeon.render 
      update
      sleep(0.5)
    end until finished?
  end
  
private

  def finished?
    #dungeons.empty?
  end
  
  def update
    player.move
  end
  
end

#Game.new.run