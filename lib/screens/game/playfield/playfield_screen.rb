require 'screens/game/playfield/playfield_painter'
require 'screens/game/components/shape'

class PlayfieldScreen
  # @return [PlayfieldPainter]
  attr_accessor :painter
  # @return [Shape]
  attr_accessor :opponent
  # @return [Shape]
  attr_accessor :player

  def initialize
    @painter = PlayfieldPainter.new
    @opponent = Shape.new(
      0,
      0,
      [],
      Colors::Square::DEFAULT_SQUARE_COLOR
    )
    @opponent.width = Config::PUZZLE_WIDTH
    @opponent.height = Config::PUZZLE_HEIGHT
    @opponent.squares.concat(
      [
        Square.new(19, 0, Colors::Tetromino::GREEN),
        Square.new(18, 1, Colors::Tetromino::BLUE),
        Square.new(17, 2, Colors::Tetromino::CYAN),
        Square.new(16, 3, Colors::Tetromino::RED)
      ]
    )
  end

  def paint
    @painter.draw_background
    @painter.draw_guide(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
    @opponent.draw
  end
end
