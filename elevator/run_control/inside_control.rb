# frozen_string_literal: true

class Control
  attr_accessor :control_panel

  def select_floor(floor)
    control_panel.floor = floor.to_i
  end

  def call_help
    control_panel.call_help = puts 'call to repairer Vasyl'
  end

  def door_open
    control_panel.door = true
  end

  def door_close
    control_panel.door = false
  end
end