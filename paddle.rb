class Paddle
  attr_accessor :is_colliding

  def initialize()
  end

  def draw(x, y, width, height, color, zOrder)
    Gosu.draw_rect(x, y, width, height, color, zOrder)
  end
end
