require_relative "strategy/hug_left_wall"

class Player
  attr_accessor :x, :y, :surroundings

  def initialize
    @strategy = Strategy::HugLeftWall.new self
  end

  # Implement this method to move around the dungeon.
  # You can move 1 square in any direction on each call of this method call
  # surroundings.view to see what's around you and base your decisions on that
  # information.
  def move
    @strategy.play surroundings.view
  end

  def start_at(x,y)
    @x = x
    @y = y
  end

  def position
    [x,y]
  end

  def go_north
    @y -= 1
  end

  def go_northeast
    @x += 1
    @y -= 1
  end

  def go_east
    @x += 1
  end

  def go_southeast
    @x += 1
    @y += 1
  end

  def go_south
    @y += 1
  end

  def go_southwest
    @x -= 1
    @y += 1
  end

  def go_west
    @x -= 1
  end

  def go_northwest
    @x -= 1
    @y -= 1
  end
end
