require 'gosu'

class Player
  attr_accessor :x, :y, :width

  def initialize(x, y, width)
    @x = x
    @y = y
    @width = width
  end
end

class Rubytris < Gosu::Window
  attr_reader :width, :height, :vSpeed, :hSpeed

  def initialize
    @width = 640
    @height = 480
    @vSpeed = 3
    @hSpeed = 2.7
    super(@width, @height)
    self.caption = 'Tutorial Game'
    @player = Player.new(20, 20, 100)
  end

  def update
    @player.x = (@player.x + @hSpeed) % @width
    @player.y = (@player.y + @vSpeed) % @height
  end

  def draw
    Gosu.draw_rect(@player.x, @player.y, @player.width, @player.width, Gosu::Color::AQUA)
  end
end

Rubytris.new.show
