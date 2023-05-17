require 'gosu'
require 'rubygems'

class Paddle
  attr_accessor :is_colliding

  def initialize()
  end

  def draw(x, y, width, height, color, zOrder)
    Gosu.draw_rect(x, y, width, height, color, zOrder)
  end
end

class Ball

end


class App < Gosu::Window
  def initialize(width = 1024, height = 768, is_full_screen = false, title = "Pong game")
    super(width, height, is_full_screen)
    self.caption = title
    @paddle_1 = Paddle.new()
    @paddle_2 = Paddle.new()
    @left_x = 40
    @left_y = self.height / 2 - 100
    @right_x = self.width - 80
    @right_y = self.height / 2 -100
    @speed = 5
    @right_btn_down = false
    @right_btn_up = false
    @left_btn_down = false
    @left_btn_up = false
  end

  def draw()
    @paddle_1.draw(@left_x, @left_y, 30, 150, Gosu::Color::WHITE, 2)
    @paddle_2.draw(@right_x, @right_y, 30, 150, Gosu::Color::WHITE, 2)
  end
  def update()

    # if @right_btn_down
    #   @right_y += @speed
    # elsif @right_btn_up
    #   @right_y -= @speed
    # elsif @left_btn_down
    #   @left_y += @speed
    # elsif @left_btn_up
    #   @left_y -= @speed
    # end
    if @right_btn_down && !@right_btn_up
      @right_y += @speed
    elsif @right_btn_up && !@right_btn_down
      @right_y -= @speed
    end

    if @left_btn_down && !@left_btn_up
      @left_y += @speed
    elsif @left_btn_up && !@left_btn_down
      @left_y -= @speed
    end

  end

  def needs_cursor?()
    return true
  end

  def button_down(id)
    if id == Gosu::KbDown
      @right_btn_down = true
    elsif id == Gosu::KbUp
      @right_btn_up = true
    elsif id == Gosu::KbW
      @left_btn_up = true
    elsif id == Gosu::KbS
      @left_btn_down = true
    end
  end

  def button_up(id)
    if id == Gosu::KbDown
      @right_btn_down = false
    elsif id == Gosu::KbUp
      @right_btn_up = false
    elsif id == Gosu::KbW
      @left_btn_up = false
    elsif id == Gosu::KbS
      @left_btn_down = false
    end
  end
end

App.new().show()