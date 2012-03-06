module Strategy
  class HugLeftWall
    def initialize player
      @player = player
    end

    def play surroundings
      @player.go_southeast
    end
  end
end
