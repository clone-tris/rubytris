class GameScreen < Screen
  # rubocop:disable Metrics/AbcSize
  def initialize
    super
    @score = Score.new

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

    @sidebar = SidebarScreen.new(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT, @score)
    @painter = GamePainter.new
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
  # rubocop:enable Metrics/AbcSize

  def paint
    @painter.draw_sidebar(@sidebar, @next_player).draw(0, 0, 0)
    @painter.draw_playfield(@opponent, @player).draw(Config::SIDEBAR_WIDTH, 0, 0)
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

    foreshadow = @player.copy
    foreshadow.translate(row_direction, column_direction)
    able_to_move = !foreshadow.collides_with?(@opponent) && foreshadow.within_bounds?

    @player = foreshadow if able_to_move

    able_to_move
  end

  def rotate_player
    return if @paused

    foreshadow = @player.copy
    foreshadow.rotate
    return unless !foreshadow.collides_with?(@opponent) && foreshadow.within_bounds?

    @player = foreshadow
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
