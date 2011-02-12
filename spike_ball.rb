require 'level'

class SpikeBall
  include Level
  
  def initialize(game_window)
    @game_window = game_window
    @icon = @icon1
    @icon1 = Gosu::Image.new(@game_window, "images/Level1boss.png", true)
    @icon2 = Gosu::Image.new(@game_window, "images/Level2boss.png", true)
    @icon3 = Gosu::Image.new(@game_window, "images/Level3boss.png", true)
    reset!
  end
  
  
  
  def my_type
    "spike"
  end
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + 10
    end
    if @game_window.get_level == 2
      @icon = @icon2
    end

    if @game_window.get_level == 3
      @icon = @icon3
    end
  end
  
  def draw
    @icon.draw(@x,@y,2)
  end
  
  def x
    @x
  end
  
  def y
    @y
  end
  
  def reset!
    @y = 0
    @x = rand(@game_window.width)
    @icon = Gosu::Image.new(@game_window, "images/Level1boss.png", true)
  end
  
end