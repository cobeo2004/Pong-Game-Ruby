require './circle'
require 'rubygems'

class Ball
  def initialize(radius = 5)
    @ball = Gosu::Image.new(Circle.new(radius))
  end

  def draw(x, y, zOrder, rW, rH, color)
    @ball.draw(x, y, zOrder, rW, rH, color)
  end
end

