class Bonusminus50
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/Level1bonusminus50.png", true)
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