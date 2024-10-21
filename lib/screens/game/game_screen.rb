class GameScreen < Screen
  def initialize
    super
    @playfield = PlayfieldScreen.new(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
    @sidebar = SidebarScreen.new(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT, @score)
    @paused = false
    @show_game_over = false
    @is_player_falling = false
    @is_mopping_floor = false
    @on_floor = false
    @should_restart = false
    @next_fall = Time.now
    @remaining_after_paused = 0
    @floor_rate = 500
    @fall_rate = 1000
    @score = Score.new
    @next_player = Tetromino.random_tetromino
    @keys_table = {
      Gosu::KB_W => method(:rotate_player),
      Gosu::KB_UP => method(:rotate_player),
      Gosu::KB_SPACE => method(:rotate_player),
      Gosu::KB_A => method(:move_player_left),
      Gosu::KB_LEFT => method(:move_player_left),
      Gosu::KB_D => method(:move_player_right),
      Gosu::KB_RIGHT => method(:move_player_right),
      Gosu::KB_S => method(:move_player_down),
      Gosu::KB_DOWN => method(:move_player_down),
      Gosu::KB_R => method(:restart),
      Gosu::KB_P => method(:toggle_paused)
    }
  end

  def paint
    next_player_canvas = Gosu.render(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH) do
      @sidebar.painter.draw_guide(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH)
      @next_player.draw
    end
    sidebar_ranvas = Gosu.render(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT) do
      @sidebar.paint(next_player_canvas)
    end
    playfield_canvas = Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      @playfield.paint
    end

    sidebar_ranvas.draw(0, 0, 0)
    playfield_canvas.draw(Config::SIDEBAR_WIDTH, 0, 0)
  end

  def update
    ScreenEvent::GO_TO_GAME if @should_restart
  end

  def button_down(key)
    return unless @keys_table[key]

    @keys_table[key].call
  end

  def apply_gravity
    now = Time.now
  end

  def make_player_fall; end

  def mop_the_floor; end

  def spawn_player; end

  def apply_score; end

  def reset_score; end

  def eat_player; end

  def toggle_paused; end

  def restart
    @should_restart = true
  end

  # @param row_direction [Integer]
  # @param column_direction [Integer]
  # @return [Boolean]
  def move_player(row_direction, column_direction)
    return false if @paused

    foreshadow = @playfield.player.copy
    foreshadow.translate(row_direction, column_direction)
    able_to_move = !foreshadow.collides_with?(@playfield.opponent) && foreshadow.within_bounds?

    @playfield.player = foreshadow if able_to_move

    able_to_move
  end

  def rotate_player
    return if @paused

    foreshadow = @playfield.player.copy
    foreshadow.rotate
    return unless !foreshadow.collides_with?(@playfield.opponent) && foreshadow.within_bounds?

    @playfield.player = foreshadow
  end

  def move_player_left
    move_player(0, -1)
  end

  def move_player_right
    move_player(0, 1)
  end

  def move_player_down
    move_player(1, 0)
  end
end
