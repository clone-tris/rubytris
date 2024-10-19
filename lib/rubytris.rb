$LOAD_PATH.unshift(File.expand_path('.', __dir__))
require 'imports'

class Rubytris < Gosu::Window
  attr_reader :width, :height

  def initialize
    @width = Config::CANVAS_WIDTH
    @height = Config::CANVAS_HEIGHT
    super(@width, @height)
    self.caption = 'Rubytris'

    @current_screen = GameScreen.new
  end

  def update
    @current_screen.update
  end

  def draw
    @current_screen.paint
  end

  # @param [Integer]
  def button_down(key)
    @current_screen.button_down(key)
  end
end

Rubytris.new.show
