# frozen_string_literal: true

class OutsideDisplay
  attr_accessor :monitor

  def initialize(monitor)
    self.monitor = monitor
  end

  def show_out_control(stay_floor, destination, direction)
    direction_string = direction == 1 ? 'UP' : 'DOWN'
    puts "  Direction #{direction_string}"
    print '  Floor '
    if direction == 1
      destination += 1
      until stay_floor == destination
        print stay_floor.to_s + ' '
        sleep(1)
        stay_floor += 1
      end
    elsif direction == -1
      destination -= 1
      until stay_floor == destination
        print stay_floor.to_s + ' '
        sleep(1)
        stay_floor -= 1
      end
    end
  end
end