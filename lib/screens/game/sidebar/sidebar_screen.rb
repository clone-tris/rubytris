require 'screens/game/sidebar/sidebar_painter'

class SidebarScreen
  # @param score [Score]
  def initialize(width, height, score)
    @width = width
    @height = height
    @painter = SidebarPainter.new
    @next_player = Tetromino.random_tetromino
    @score = score
  end

  def paint
    @painter.draw_background(@width, @height)
    @painter.draw_next_player(@next_player)
    @painter.draw_score(@score)
  end
end
