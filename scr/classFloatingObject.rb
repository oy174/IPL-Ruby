module ZOrder
  Background, FloatingObjects, Player, UI = *0..3
end

class FloatingObject	
	def initialize(window)
		@image = Gosu::Image(window, "../img/Ship.png", false)
		@x = @y = @angle = rand(640), rand(240), rand(360)
		@speed_modifier = 2
	end
	
	def draw
		image.draw_rot(@x, @y, 1, @angle)
	end
	
	def move
		@x += @speed_modifier*Math.sin(Math::PI/180*@angle)
		@y += -@speed_modifier*Math.cos(Math::PI/180*@angle)
		@x %= 1920
		@y %= 1080
	end
end