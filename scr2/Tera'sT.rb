require 'rubygems'
require 'gosu'
require 'classPlayer.rb'
require 'classFire'
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
    
    @floatingObjects = [FloatingObject.new(self)]
    ##@floatingObjects.warp(1720, 500)
    
    @fires = [Fire.new(self, @player)] ## should be blank array and be filled with this here*
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
    
    @player.move
    @floatingObjects.each {|floatingObject| floatingObject.move}
    
    @fires.each {|fire| fire.move}
    @fires.reject! {|fire| fire.remove}
    
    detectCollisions
  end
  
  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @player.draw
    @floatingObjects.each {|floatingObject| floatingObject.draw}
    @fires.each {|fire| fire.draw}
  end
   
  def detectCollisions
    @floatingObjects.each do |floatingObject|
      if collision?(floatingObject, @player)
        puts "There was a collision"
      end
    end
  end

  def collision?(object1, object2)
    hitbox1, hitbox2 = object1.hitbox, object2.hitbox
    hitbox1[:x] === hitbox2[:x]
    hitbox1[:y] === hitbox2[:y]
  end

  def button_down(id)
    if id == Gosu::KbZ
      @fires << Fire.new(self, @player) ## here*
    end
  end
        
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
