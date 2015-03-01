class Fire
    attr_accessor :currentRange, :maxRange
  def initialize(window, ship)
    @image = Gosu::Image.new(window, "../img/Ship.png", false)
    @x, @y, @angle = ship.x, ship.y, 0.0
    @currentRange, @maxRange = 0, 75
  end
  
  def move
    @x += 20
    @x %= 1920
    @currentRange += 1
  end
  
  def remove
    currentRange > maxRange
  end
  
  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.25, 0.25)
  end
  
end