require 'gosu'

class Player
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Tutorial Game'
    @player = Player.new(20, 20)
  end

  def update
    # ...
  end

  def draw
    Gosu.draw_rect(@player.x, @player.y, 5, 5, Gosu.AQUA)
  end
end

Tutorial.new.show
