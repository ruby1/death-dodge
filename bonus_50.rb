require 'level'

class Bonus50
  include Level
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/Level1bonus50.png", true)
    reset!
  end
  
  
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + 15
    end
  end
  
  def draw
    if level_changed? && get_level == 2
      @icon = Gosu::Image.new(@game_window, "images/Level2bonus50.png", true)
    end

    if level_changed? && get_level == 3
      @icon = Gosu::Image.new(@game_window, "images/Level3bonus50.png", true)
    end
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
  end
end