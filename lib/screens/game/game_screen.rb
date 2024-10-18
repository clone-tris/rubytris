require 'engine/screen'
require 'screens/game/playfield/playfield_screen'
require 'screens/game/sidebar/sidebar_screen'
require 'screens/game/components/score'

class GameScreen < Screen
  def initialize
    super
    @score = Score.new
    @playfield = PlayfieldScreen.new(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
    @sidebar = SidebarScreen.new(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT, @score)
  end

  def paint
    sidebar_ranvas = Gosu.render(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT) do
      @sidebar.paint
    end
    playfield_canvas = Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      @playfield.paint
    end

    sidebar_ranvas.draw(0, 0)
    playfield_canvas.draw(Config::SIDEBAR_WIDTH, 0)
  end
end
