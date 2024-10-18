class SidebarScreen
  # @return [SidebarPainter]
  attr_reader :painter

  # @param width [Integer]
  # @param height [Integer]
  # @param score [Score]
  def initialize(width, height, score)
    @width = width
    @height = height
    @painter = SidebarPainter.new
    @score = score
  end

  # @param next_player_canvas [Gosu::Image]
  def paint(next_player_canvas)
    @painter.draw_background(@width, @height)
    @painter.draw_next_player(next_player_canvas)
    @painter.draw_score(@score)
  end
end
