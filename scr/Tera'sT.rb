require 'rubygems'
require 'gosu'
require 'classPlayer.rb'
require 'classFloatingObject.rb'

=begin
This sets up the the window.
The @backgrounds_image sets up the background images
The @player connects the player class to the window
=end
class GameWindow < Gosu::Window
	def initialize
		super 800, 600, false
		self.caption = "Tera's Termination"
		
		@background_image = Gosu::Image.new(self, "../img/Darkness.png", true)
		
		@player = Player.new(self)
		@player.warp(320, 240)
		
		@FloatingObject_anim = Gosu::Image::load_tiles(self, "../img/FloatingObject.png", 25, 25, false)
		@FloatingObjects = Array.new
	end
	
	def update
		## LEFT AND RIGHT NOT WORKING
		if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then @player.accelerate_Left
		end
		if button_down? Gosu::KbRight or button_down? Gosu::GpRight then @player.accelerate_Right
		end
		if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then @player.accelerate_Up
		end
		if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then @player.accelerate_Down
		end
		
		@player.move
	end
	
	def draw
		@background_image.draw(0, 0, ZOrder::Background)
		@player.draw
		##PROBLEM WITH FLOATINGOBJECTS ARRAY
		##@FloatingObjects.each { |FloatingObjects| FloatingObject.draw }
	end
	
	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show
