module Colors
  module Tetromino
    CYAN = 0x6DECEEFF
    BLUE = 0x0014E6FF
    ORANGE = 0xE4A338FF
    YELLOW = 0xF0EF4FFF
    GREEN = 0x6EEB47FF
    PURPLE = 0x9225E7FF
    RED = 0xDC2F20FF
  end

  module Square
    DEFAULT_SQUARE_COLOR = 0xcc8081FF
    BORDER_TOP = 0xffffffb3
    BORDER_BOTTOM = 0x00000080
    BORDER_SIDE = 0x0000001a
  end

  module Ui
    BACKGROUND = 0x333333FF
    SIDEBAR_BACKGROUND = 0x545454FF
    POPUP_BACKGROUND = 0x212121FF
    BUTTON_BACKGROUND = Tetromino::CYAN
    GUIDE = 0x555555FF
    WHITE_TEXT = 0xFFFFFFFF
    POPUP_TEXT = 0xEFEFEFFF
    BUTTON_TEXT = 0x212121FF
  end
end
