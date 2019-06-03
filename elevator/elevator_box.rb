# frozen_string_literal: true

class ElevatorBox
  attr_accessor :inside_display, :control_panel, :system_control, :stay_floor, :door, :people, :first_engine, :second_engine, :direction, :outside_display
  def initialize(inside_display, control_panel, system_control, door, first_engine, second_engine, outside_display)
    self.control_panel = control_panel
    self.outside_display = outside_display
    self.inside_display = inside_display
    self.system_control = system_control
    self.door = door
    self.first_engine  = first_engine
    self.second_engine = second_engine
    self.stay_floor = 1
    self.people = []
  end

  def start(log = false, display = '')
    door.close
    destination = control_panel.floor
    system_control.initialize_floor(stay_floor)
    @direction = system_control.direction(destination)
    if direction == 1
      direction_string = 'UP'
      puts "Floor #{stay_floor} [door close] direction #{direction_string}" if log
      out_display if display == 'out'
      ins_display if display == 'ins'
      self.stay_floor = system_control.move_up(destination)
    elsif direction == -1
      direction_string = 'DOWN'
      puts "Floor #{stay_floor} [door close] direction #{direction_string}" if log
      out_display if display == 'out'
      ins_display if display == 'ins'
      self.stay_floor = system_control.move_down(destination)
    elsif direction.zero?
      self.stay_floor = destination
    end
    stop_status = control_panel.floor - stay_floor
    if stop_status.zero?
      door.open
      sleep(3)
      door.close
    end
  end

  def log_move(ins = '')
    if people.count <= 3
      unless first_engine.on
        puts "\nFloor #{stay_floor} [door open]"
        puts "Floor #{stay_floor} [total person] #{people.count}"
        first_engine.engine_on
      end
      start(true, ins)
      first_engine.engine_off
    else
      puts "\nFloor #{stay_floor} [door open]"
      puts "Floor #{stay_floor} [total person] #{people.count}"
      first_engine.engine_on
      second_engine.engine_on
      puts "Floor #{stay_floor} [turn on second engine]"
      start(true, ins)
      second_engine.engine_off
      first_engine.engine_off
    end
  end

  def control
    control_panel.control
  end

  def ins_display
    inside_display.show_control(stay_floor, control_panel.floor, system_control.speed_value, direction, people.sum)
  end

  def out_display
    outside_display.show_out_control(stay_floor, control_panel.floor, direction)
  end

  def free_people(count)
    n = 0
    while n != count
      people.pop
      n += 1
    end
  end

  def add_people(passengers = [])
    self.people = passengers
  end
end
