class PlayfieldScreen
  # @return [PlayfieldPainter]
  attr_accessor :painter
  # @return [Shape]
  attr_accessor :opponent
  # @return [Shape]
  attr_accessor :player

  # @param width [Integer]
  # @param height [Integer]
  def initialize(width, height)
    @width = width
    @height = height
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
    @player = Tetromino.random_tetromino
    @player.translate(8, 0)
  end

  def paint
    @painter.draw_guide(@width, @height)
    @opponent.draw
    @player.draw
  end
end
