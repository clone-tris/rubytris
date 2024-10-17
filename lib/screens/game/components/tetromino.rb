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
  T: Colors::TeTetromino::PURPLE,
  Z: Colors::TeTetromino::RED,
  S: Colors::TeTetromino::GREEN,
  L: Colors::TeTetromino::ORANGE,
  J: Colors::TeTetromino::BLUE,
  O: Colors::TeTetromino::YELLOW,
  I: Colors::Tetromino::CYAN
}.freeze

module Tetromino
  # @param name [String]
  def get_tetromino(name); end
end
