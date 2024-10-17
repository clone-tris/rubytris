require 'engine/screen'
require 'screens/game/playfield/playfield_screen'

class GameScreen < Screen
  def initialize
    super

    @playfield = PlayfieldScreen.new
  end

  def paint
    playfield_canvas = Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      @playfield.paint
    end

    playfield_canvas.draw(Config::SIDEBAR_WIDTH, 0)
  end
end
