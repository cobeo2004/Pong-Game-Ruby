require 'gosu'
require 'rubygems'
require './ball'
require './paddle'


class App < Gosu::Window
  def initialize(width = 1024, height = 768, is_full_screen = false, title = "Pong game")
    super(width, height, is_full_screen)
    self.caption = title
    @paddle_1 = Paddle.new()
    @paddle_2 = Paddle.new()
    @ball = Ball.new(15)
    @left_x = 40
    @left_y = self.height / 2 - 100
    @right_x = self.width - 80
    @right_y = self.height / 2 -100
    @width = 30
    @height = 150
    @speed = 5
    @boost_speed = 10
    @dbg_font = Gosu::Font.new(15)
    @left_shift = false
    @right_shift = false
    @right_btn_down = false
    @right_btn_up = false
    @left_btn_down = false
    @left_btn_up = false
  end

  def draw()
    @paddle_1.draw(@left_x, @left_y, @width, @height, Gosu::Color::WHITE, 2)
    @paddle_2.draw(@right_x, @right_y, @width, @height, Gosu::Color::WHITE, 2)
    @ball.draw(self.width / 2, self.height / 2, 2, 1.0, 1.0, Gosu::Color::WHITE)
    @dbg_font.draw("lX: #{@left_x} lY: #{@left_y}\nrX: #{@right_x} rY: #{@right_y}", 700,300, 3, 2.0, 2.0, Gosu::Color::WHITE)
  end
  def update()

    if @right_btn_down && !@right_btn_up
      if @right_shift
        @right_y += @speed + @boost_speed
      else
        @right_y += @speed
      end

    elsif @right_btn_up && !@right_btn_down
      if @right_shift
        @right_y -= @speed + @boost_speed
      else
        @right_y -= @speed
      end
    end

    if @left_btn_down && !@left_btn_up
      if @left_shift
        @left_y += @speed + @boost_speed
      else
        @left_y += @speed
      end

    elsif @left_btn_up && !@left_btn_down
      if @left_shift
        @left_y -= @speed + @boost_speed
      else
        @left_y -= @speed
      end
    end

    @right_y = 0 if @right_y <= 0
    @right_y = self.height - @height if @right_y >= self.height - @height
    @left_y = 0 if @left_y <= 0
    @left_y = self.height - @height if @left_y >= self.height - @height
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
    elsif id == Gosu::KbLeftShift
      @left_shift = true
    elsif id == Gosu::KbRightShift
      @right_shift = true
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
    elsif id == Gosu::KbLeftShift
      @left_shift = false
    elsif id == Gosu::KbRightShift
      @right_shift = false
    end
  end
end

App.new().show()