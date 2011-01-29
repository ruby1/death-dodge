require 'rubygems'
require 'gosu'
require 'player'
require 'round_ball'
require 'spike_ball'
require 'bonus_50'
require 'bonus_minus_50'

class MyGame < Gosu::Window
  def initialize
    super(500, 500, false)
    @bonusminus50 = Bonusminus50.new(self)
    @player1 = Player.new(self)
    @bonus50 = Bonus50.new(self)
    # @balls = 3.times.map {Ball.new(self)}
    @balls = []
    @balls << SpikeBall.new(self)
    @balls << RoundBall.new(self)
    @balls << RoundBall.new(self)

    @running = true
    @counter = 0
    @lives = 2
    @message_font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @background = Gosu::Image.new(self, "images/black-background.png", true)
    @score = 0
    @highscore = 0
  end
  
  def update
    if @running
      @score = @score + 1
            
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end
    
      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end
    
      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end
    
      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
    
      @bonusminus50.update
    
      @bonus50.update
    
      @balls.each {|ball| ball.update}
    
      if @player1.hit_by_round_ball? @balls
        if @counter >= @lives
          stop_game!
        else
          @counter = @counter + 1
          restart_game
        end
      end
      
      if @player1.hit_by_spike_ball? @balls
        if @counter >= @lives
          stop_game!
        else
          @counter = @counter + 2
          restart_game
        end
      end
      
    else
      if button_down? Gosu::Button::KbEscape
        if @highscore <= @score
          @highscore = @score
        end
        @score = 0
        @counter = 0
        restart_game
      end
    end
    
    if @player1.hit_by_Bonus50?(@bonus50)
      @score = @score + 50
      restart_game
    end
      
    if @player1.hit_by_Bonusminus50?(@bonus50)
      @score = @score - 50
      restart_game
    end
      
  end
  
  
  def draw
    @bonusminus50.draw
    @bonus50.draw
    @background.draw(0,0,1)
    @message_font.draw("The high score is: #{@highscore}",25,50,5)
    @message_font.draw("You have #{@lives - @counter + 1} lives remaining",25,475,5)
    @message_font.draw("Your score is: #{@score}",25,25,5)
    @player1.draw
    @balls.each {|ball| ball.draw}
  end
  
  def stop_game!
    @running = false
  end
  
  def restart_game
    @running = true
    @balls.each {|ball| ball.reset!}
  end
  
end

game = MyGame.new
game.show
