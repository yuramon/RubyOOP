# frozen_string_literal: true

# first engine
class FirstEngine
  attr_accessor :on, :power
  def initialize
    self.on = false
    self.power = 1
  end

  def engine_on
    @on = true
  end

  def engine_off
    @on = false
  end
end