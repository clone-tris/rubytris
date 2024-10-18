class Score
  # @param level [Integer]
  attr_accessor :level

  # @param total [Integer]
  attr_accessor :total

  # @param lines_cleared [Integer]
  attr_accessorr :lines_cleared

  def initialize
    @level = 1
    @total = 0
    @lines_cleared = 0
  end

  POINTS_TABLE = {
    1 => 40,
    2 => 100,
    3 => 300,
    4 => 1200
  }.freeze
end
