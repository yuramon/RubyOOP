class Passenger
  attr_accessor :weight
  def initialize
    @weight = rand(45..100)
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