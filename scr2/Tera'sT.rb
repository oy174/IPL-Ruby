require 'rubygems'
require 'gosu'
##require 'Math'
require 'classPlayer.rb'
require 'classFloatingObject.rb'

=begin
This sets up the the window.
The @backgrounds_image sets up the background images
The @player connects the player class to the window
=end
class GameWindow < Gosu::Window
  def initialize
    super(1920, 1080, false)
    self.caption = "Tera's Termination"
    
    @background_image = Gosu::Image.new(self, "../img/Darkness.png", true)
    
    @player = Player.new(self)
    @player.warp(150, 240)
    
    @floatingObjects = FloatingObject.new(self)
    @floatingObjects.warp(1720, 500)
  end
  
  def update
    if button_down? Gosu::KbLeft then @player.accelerate_Left
    end
    if button_down? Gosu::KbRight then @player.accelerate_Right
    end
    if button_down? Gosu::KbUp then @player.accelerate_Up
    end
    if button_down? Gosu::KbDown then @player.accelerate_Down
    end
    ## crashes game
    if button_down? Gosu::KbZ then @floatingObjects.accelerate_Left
    end
    
    @player.move
    @floatingObjects.move
  end
  
  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @player.draw
    @floatingObjects.draw
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
