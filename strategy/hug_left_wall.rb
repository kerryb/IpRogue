module Strategy
  class HugLeftWall

    DIRECTIONS = {northwest: 0, north: 1, northeast: 2, east: 5,
                  southeast: 8, south: 7, southwest: 6, west: 3}

    def initialize player
      @player = player
      @direction = :north
    end

    def play surroundings
      @surroundings = surroundings
      if can_see_target
        go_to_target
      elsif at_left_turn
        turn_left
      elsif facing_wall
        turn_right
      end
      @player.send :"go_#{@direction}"
    end

    private

    def can_see_target
      find_target
    end

    def facing_wall
      @surroundings[DIRECTIONS[@direction]][2] == "#"
    end

    def at_left_turn
      @surroundings[DIRECTIONS[relative_direction(-2)]][2] != "#"
    end

    def turn_right
      @direction = relative_direction(2)
    end

    def turn_left
      @direction = relative_direction(-2)
    end

    def go_to_target
      @direction = DIRECTIONS.invert[find_target]
    end

    def find_target
      @surroundings.index {|s| %w{> &}.include?(s[2])}
    end

    def relative_direction offset
      DIRECTIONS.keys[(DIRECTIONS.keys.index(@direction) + offset) % 8]
    end
  end
end
