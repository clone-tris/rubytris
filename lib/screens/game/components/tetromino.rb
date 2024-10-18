module Tetromino
  NAMES = %i[
    T
    Z
    S
    L
    J
    O
    I
  ].freeze

  SQUARES = {
    T: [[0, 0], [0, 1], [0, 2], [1, 1]],
    Z: [[0, 0], [0, 1], [1, 1], [1, 2]],
    S: [[0, 1], [0, 2], [1, 0], [1, 1]],
    L: [[0, 0], [0, 1], [0, 2], [1, 0]],
    J: [[0, 0], [1, 0], [1, 1], [1, 2]],
    O: [[0, 0], [0, 1], [1, 0], [1, 1]],
    I: [[0, 0], [0, 1], [0, 2], [0, 3]]
  }.freeze

  COLORS = {
    T: Colors::Tetromino::PURPLE,
    Z: Colors::Tetromino::RED,
    S: Colors::Tetromino::GREEN,
    L: Colors::Tetromino::ORANGE,
    J: Colors::Tetromino::BLUE,
    O: Colors::Tetromino::YELLOW,
    I: Colors::Tetromino::CYAN
  }.freeze

  # @param name [Symbol]
  # @return [Shape]
  def self.get_tetromino(name)
    Shape.new(
      0,
      0,
      SQUARES[name].map { |cell| Square.new(cell[0], cell[1], COLORS[name]) },
      COLORS[name]
    )
  end

  # @return [Shape]
  def self.random_tetromino
    get_tetromino(NAMES.sample)
  end
end
