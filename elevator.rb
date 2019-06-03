# frozen_string_literal: true

class Passenger
  attr_accessor :weight
  def initialize
    @weight = rand(45..100)
  end
end

class Door
  attr_accessor :door

  def initialize
    self.door = false
  end

  def open
    self.door = true
  end

  def close
    self.door = false
  end
end

class ElevatorBox
  attr_accessor :inside_display, :control_panel, :system_control, :stay_floor, :door, :people, :first_engine, :second_engine
  def initialize(inside_display, control_panel, system_control, door, first_engine, second_engine)
    self.control_panel = control_panel
    self.inside_display = inside_display
    self.system_control = system_control
    self.door = door
    self.first_engine  = first_engine
    self.second_engine = second_engine
    self.stay_floor = 1
    self.people = []
  end

  def move_to_floor
    door.close
    destination = control_panel.floor
    system_control.initialize_floor(stay_floor)
    direction = system_control.direction(destination)
    if direction == 1
      puts "#{inside_display.show_control(stay_floor)} [door close] direction UP"
    elsif
    direction == -1
      puts "#{inside_display.show_control(stay_floor)} [door close] direction DOWN"
    end
    self.stay_floor = system_control.move_up(destination) if direction == 1
    self.stay_floor = system_control.move_down(destination) if direction == -1
    self.stay_floor = destination if direction.zero?
    stop_status = control_panel.floor - stay_floor
    if stop_status.zero?
      door.open
      sleep(3)
    end
  end

  def log_move
    if people.count <= 3
      if first_engine.on == false
        puts "#{inside_display.show_control(stay_floor)} [door open]"
        puts "#{inside_display.show_control(stay_floor)} [total person] #{people.count}"
        first_engine.engine_on
      end
      move_to_floor
      first_engine.engine_off
    else
      puts "#{inside_display.show_control(stay_floor)} [door open]"
      puts "#{inside_display.show_control(stay_floor)} [total person] #{people.count}"
      first_engine.engine_on
      second_engine.engine_on
      puts "#{inside_display.show_control(stay_floor)} [turn on second engine]"
      move_to_floor
      second_engine.engine_off
      first_engine.engine_off
    end
  end

  def control
    control_panel.control
  end

  def ins_display
    if first_engine.on == false
      puts "#{inside_display.show_control(stay_floor)}[door open]"
      puts "#{inside_display.show_control(stay_floor)}[total person] #{people.count}"
    end
    move
    if first_engine.on == true
      puts "#{inside_display.show_control(stay_floor)}[door close]"
    end
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

class Control
  attr_accessor :control_panel

  def select_floor(floor)
    control_panel.floor = floor.to_i
  end

  def call_help
    control_panel.call_help = 'call to repairer Vasyl'
  end

  def door_open
    control_panel.door = true
  end

  def door_close
    control_panel.door = false
  end
end

class ControlPanel
  attr_accessor :floor, :call_help, :door, :control

  def initialize
    self.floor = 1
    self.door = false
  end

  def add_control(control)
    self.control = control
    control.control_panel = self
  end
end

class InsideDisplay
  attr_accessor :monitor

  def initialize(monitor)
    self.monitor = monitor
  end

  def show_control(floor)
    "Floor #{floor}"
  end
end

class Monitor
  attr_accessor :resolution, :type, :contrast

  def initialize(resolution, type, contrast)
    self.resolution = resolution
    self.type = type
    self.contrast = contrast
  end
end

class SystemControl
  attr_accessor :current_floor
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
end

class ElevatorBuild
  attr_accessor :elevator_box, :monitor

  def initialize
    monitor = Monitor.new('1024#768', 'LCD', '1:1000')
    inside_display = InsideDisplay.new(monitor)
    inside_display.show_control(Control.new)
    control_panel = ControlPanel.new
    control_panel.add_control(Control.new)
    system_control = SystemControl.new
    door = Door.new
    first_engine = FirstEngine.new
    second_engine = SecondEngine.new
    self.elevator_box = ElevatorBox.new(inside_display, control_panel, system_control, door, first_engine, second_engine)
  end
end
class Passengers
  attr_accessor :array_of_passengers
  def initialize
    self.array_of_passengers = []
  end

  def add(count)
    n = 0
    while n != count
      passengers = Passenger.new
      array_of_passengers.push(passengers.weight)
      n += 1
    end
    array_of_passengers
  end
end

class FirstEngine
  attr_accessor :on
  def initialize
    self.on = false
  end

  def engine_on
    @on = true
  end

  def engine_off
    @on = false
  end
end

class SecondEngine
  attr_accessor :on
  def initialize
    self.on = false
  end

  def engine_on
    @on = true
  end

  def engine_off
    @on = false
  end
end
pass = Passengers.new
elevator_builder = ElevatorBuild.new
elevator = elevator_builder.elevator_box
elevator.add_people(pass.add(5))
elevator.control.select_floor(6)
# puts elevator.ins_display
elevator.log_move
elevator.free_people(2)
elevator.control.select_floor(2)
# puts elevator.ins_display
elevator.log_move
# puts elevator.ins_display
