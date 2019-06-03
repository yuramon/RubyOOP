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
