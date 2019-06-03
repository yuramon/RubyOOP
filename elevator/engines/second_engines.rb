# frozen_string_literal: true

# second  engine
class SecondEngine
attr_accessor :on, :power
def initialize
  self.on = false
  self.power = 2
end

def engine_on
  @on = true
end

def engine_off
  @on = false
end
end