# frozen_string_literal: true

class InsideDisplay
  attr_accessor :monitor

  def initialize(monitor)
    self.monitor = monitor
  end

  def show_control(stay_floor, destination, speed, direction, weight)
    direction_string = direction == 1 ? 'UP' : 'DOWN'
    puts "-----------------------------\n|     INSIDE DISPLAY       |\n----------------------------- "
    puts "  Speed #{speed}"
    puts "  Direction #{direction_string}"
    puts "  Weight #{weight}"
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