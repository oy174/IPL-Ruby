class Fire
  def initialize(window)
    @imageFire = Gosu::Image.new(window, "../img/Ship.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
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
    @imageFire.draw_rot(@x, @y, 1, @angle)
  end
end