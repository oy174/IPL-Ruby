## Character creation
class Player
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "../img/Ship.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end
  
  def warp (x, y)
    @x, @y = x, y
  end
  
  def accelerate_Left
    @vel_x += -0.5
  end
  
  def accelerate_Right
    @vel_x += 0.5
  end
  
  def accelerate_Up
    @vel_y += -0.5
  end
  
  def accelerate_Down
    @vel_y += Gosu::offset_y(@angle, -0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1920
    @y %= 1080
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end
  
  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.8, 0.8)
  end
end