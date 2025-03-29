$LOAD_PATH.unshift(File.expand_path('.', __dir__))
require 'imports'

class Rubytris < Gosu::Window
  INITIAL_REPEAT_DELAY = 0.3
  REPEAT_DELAY = 0.05

  def initialize
    @width = Config::CANVAS_WIDTH
    @height = Config::CANVAS_HEIGHT
    super(@width, @height)
    self.caption = 'Rubytris'

    @keys_down = {}
    @last_fired = {}
    @repeat_count = {}
    @current_screen = OverScreen.new
  end

  def update
    handle_repeated_keys
    screen_event, *rest = @current_screen.update

    case screen_event
    when ScreenEvent::GO_TO_GAME
      puts 'go to game event triggered'
      @current_screen = GameScreen.new
    when ScreenEvent::GO_TO_MENU
      @current_screen = GameScreen.new
    when ScreenEvent::GO_TO_OVER
      @current_screen = OverScreen.new
    when ScreenEvent::QUIT
      close!
    end
  end

  def draw
    @current_screen.paint
  end

  # @param [Integer]
  def button_down(key)
    @keys_down[key] = true
    @last_fired[key] = Time.now
    @repeat_count[key] = 0

    @current_screen.button_down(key, mouse_x, mouse_y)
  end

  # @param [Integer]
  def button_up(key)
    @keys_down.delete(key)
    @last_fired.delete(key)
    @repeat_count.delete(key)

    @current_screen.button_up(key, mouse_x, mouse_y)
  end

  def handle_repeated_keys
    current_time = Time.now

    @keys_down.each_key do |key|
      delay = @repeat_count[key].zero? ? INITIAL_REPEAT_DELAY : REPEAT_DELAY

      next unless current_time - (@last_fired[key] || 0) >= delay

      @current_screen.button_down(key, mouse_x, mouse_y)
      @last_fired[key] = current_time
      @repeat_count[key] += 1
    end
  end
end

Rubytris.new.show
