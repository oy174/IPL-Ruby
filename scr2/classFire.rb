class Fire
  def initialize(window, ship)
    @x = @y = ship.x, ship.y
    @image = Gosu::Image(window, "../img/Bullet.png", false)
  end

  def accelerate
    @vel_x += 10
  end

  def move
    @x += @vel_x
    @x %= 640

    @vel_x *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
  
  def hitbox
    hitboxX = ((@x - @image.width / 2).to_i..(@x + @image.width / 2).to_i)
    hitboxX = ((@y - @image.width / 2).to_i..(@y + @image.width / 2).to_i)
    {:x => hitboxX, :y => hitboxY}
  end
end