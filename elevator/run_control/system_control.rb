# frozen_string_literal: true

class SystemControl
  attr_accessor :current_floor, :speed
  def initialize_floor(current_floor)
    self.current_floor = current_floor
  end

  def direction(floor)
    dif = floor - current_floor
    dif.zero? ? 0 : dif / dif.abs
  end

  def move_up(destination)
    self.current_floor += 1 while destination != current_floor
    self.current_floor
  end

  def move_down(destination)
    self.current_floor -= 1 while destination != current_floor
    self.current_floor
  end

  def speed_value
    self.speed = 15
  end
end