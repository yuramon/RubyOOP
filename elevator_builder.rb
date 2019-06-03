# frozen_string_literal: true

load 'elevator/control_panel.rb'
load 'elevator/inside_display.rb'
load 'elevator/outside_display.rb'
load 'elevator/engines/first_engines.rb'
load 'elevator/engines/second_engines.rb'
load 'elevator/run_control/inside_control.rb'
load 'elevator/run_control/system_control.rb'
load 'elevator/door.rb'
load 'elevator/monitor.rb'
load 'elevator/elevator_box.rb'

class ElevatorBuild
  attr_accessor :elevator_box, :monitor

  def initialize
    inside_monitor = Monitor.new('1024#768', 'LCD', '1:1000')
    inside_display = InsideDisplay.new(inside_monitor)
    outside_monitor = Monitor.new('480#320', 'LCD', '1:1000')
    outside_display = OutsideDisplay.new(outside_monitor)
    control_panel = ControlPanel.new
    control_panel.add_control(Control.new)
    system_control = SystemControl.new
    door = Door.new
    first_engine = FirstEngine.new
    second_engine = SecondEngine.new
    self.elevator_box = ElevatorBox.new(inside_display, control_panel, system_control, door, first_engine, second_engine, outside_display)
  end
end
