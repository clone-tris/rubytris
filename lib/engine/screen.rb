class Screen
  def update; end

  def paint; end

  # @param key [Integer]
  # @param mouse_x [Integer]
  # @param mouse_y [Integer]
  def button_down(key, mouse_x, mouse_y); end

  # @param key [Integer]
  # @param mouse_x [Integer]
  # @param mouse_y [Integer]
  def button_up(key, mouse_x, mouse_y); end
end
