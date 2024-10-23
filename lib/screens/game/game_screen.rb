class GameScreen < Screen
  # rubocop:disable Metrics/AbcSize
  def initialize
    super

    @opponent = Shape.new(
      0,
      0,
      [
        Square.new(19, 0, Colors::Tetromino::GREEN),
        Square.new(18, 1, Colors::Tetromino::BLUE),
        Square.new(17, 2, Colors::Tetromino::CYAN),
        Square.new(16, 3, Colors::Tetromino::RED)
      ],
      Colors::Square::DEFAULT_SQUARE_COLOR
    )
    @opponent.width = Config::PUZZLE_WIDTH
    @opponent.height = Config::PUZZLE_HEIGHT

    @player = Tetromino.random_tetromino
    @next_player = Tetromino.random_tetromino

    @painter = GamePainter.new
    @score = Score.new
    @paused = false
    @show_game_over = false
    @is_player_falling = false
    @is_mopping_floor = false
    @on_floor = false
    @should_restart = false
    @next_fall = Time.now
    @remaining_after_paused = 0
    @end_of_lock = 0
    @floor_rate = 500
    @fall_rate = 1000
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
      Gosu::KB_P => method(:toggle_paused),
      Gosu::KB_O => method(:spawn_player)
    }
  end
  # rubocop:enable Metrics/AbcSize

  def paint
    @painter.draw_sidebar(@next_player, @score).draw(0, 0, 0)
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
    return if now < @next_fall

    if @on_floor
      mop_the_floor
    else
      make_player_fall
    end
  end

  def make_player_fall
    return if @paused || @is_player_falling

    @is_player_falling = true

    able_to_move = move_player_down
    now = Time.now
    if able_to_move
      @on_floor = false
      @next_fall = now + @fall_rate
    else
      @on_floor = true
      @end_of_lock = now + @floor_rate
      @next_fall = @end_of_lock
    end

    @is_player_falling = false
  end

  def mop_the_floor; end

  def spawn_player
    player = @next_player.copy
    player.row = player.row - player.height
    player.column = ((Config::PUZZLE_WIDTH - player.width) / 2).floor
    @player = player
    @next_player = Tetromino.random_tetromino
  end

  # @param lines_removed [Integer]
  def apply_score(lines_removed)
    base_points = Score::POINTS_TABLE[lines_removed]
    lines_cleared = @score.lines_cleared + lines_removed
    level = (lines_cleared / 10).floor + 1
    points = base_points * (level + 1)
    total = @score.total + points

    @score.level = level
    @score.lines_cleared = lines_cleared
    @score.total = total
  end

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
