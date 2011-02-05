require 'level'

class RoundBall
  include Level
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/Level1troop.png", true)
    reset!
  end
    
  def my_type
    "round"
  end
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + 12
    end
  end
  
  def draw
    if level_changed? && get_level == 2
      @icon = Gosu::Image.new(self, "images/Level2troop.png", true)
    end

    if level_changed? && get_level == 3
      @icon = Gosu::Image.new(self, "images/Level3troop.png", true)
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