module Colors
  module Tetromino
    CYAN = Gosu::Color.rgba(0x6DECEEFF)
    BLUE = Gosu::Color.rgba(0x0014E6FF)
    ORANGE = Gosu::Color.rgba(0xE4A338FF)
    YELLOW = Gosu::Color.rgba(0xF0EF4FFF)
    GREEN = Gosu::Color.rgba(0x6EEB47FF)
    PURPLE = Gosu::Color.rgba(0x9225E7FF)
    RED = Gosu::Color.rgba(0xDC2F20FF)
  end

  module Square
    DEFAULT_SQUARE_COLOR = Gosu::Color.rgba(0xcc8081FF)
    BORDER_TOP = Gosu::Color.rgba(0xffffffb3)
    BORDER_BOTTOM = Gosu::Color.rgba(0x00000080)
    BORDER_SIDE = Gosu::Color.rgba(0x0000001a)
  end

  module Ui
    BACKGROUND = Gosu::Color.rgba(0x333333FF)
    SIDEBAR_BACKGROUND = Gosu::Color.rgba(0x545454FF)
    POPUP_BACKGROUND = Gosu::Color.rgba(0x212121FF)
    BUTTON_BACKGROUND = Tetromino::CYAN
    GUIDE = Gosu::Color.rgba(0x555555FF)
    WHITE_TEXT = Gosu::Color.rgba(0xFFFFFFFF)
    POPUP_TEXT = Gosu::Color.rgba(0xEFEFEFFF)
    BUTTON_TEXT = Gosu::Color.rgba(0x212121FF)
  end
end
