require 'screens/game/sidebar/sidebar_painter'

class SidebarScreen
  # @param score [Score]
  def initialize(score)
    @painter = SidebarPainter.new
    @nextPlayer = Tetromino.random_tetromino
    @score = score
  end

  def paint
    @painter.draw_background
  end
end
