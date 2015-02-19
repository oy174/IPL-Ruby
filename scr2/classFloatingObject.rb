module ZOrder
  Background, FloatingObjects, Player, UI = *0..3
end

class FloatingObject
  def initialize(window)
    @image = Gosu::Image.new(window, "../img/floatingObject.png", false)
    @x, @y, @angle = rand(1720), rand(500), 0.0
    @score = 0
  end
  
  def warp (x, y)
    @x, @y = x, y
  end
  
  def move
    @x += -1.0
    @y += 0.0
    @x %= 1920
    @y %= 1080
  end
  
  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 1.5, 1.5)
  end
  
  def hitbox
    {
     :x =>(@x - @image.width / 2)..(@x + @image.width / 2),
     :y =>(@y - @image.height / 2)..(@y + @image.height / 2)
    }
  end
end