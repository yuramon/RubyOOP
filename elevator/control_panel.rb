# frozen_string_literal: true

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
