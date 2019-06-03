# frozen_string_literal: true

load 'passengers.rb'
load 'elevator_builder.rb'

pass = Passengers.new
elevator_builder = ElevatorBuild.new
elevator = elevator_builder.elevator_box

puts "-------------------Welcome to ELEVATOR SIMULATOR-------------------\nPlease input mode:\n1 - Elevatr-user\n2 - Programmer\n-------------------------------------------------------------------"
mode = gets
if mode.to_i == 1
  puts 'On which floor are you?'
  select_floor = gets
  puts "-----------------------------\n|     OUTSIDE DISPLAY       |\n----------------------------- "
  elevator.control.select_floor(select_floor.to_i)
  elevator.start(false, 'out')
  print "\n-----------------------------"
  elevator.log_move
  elevator.add_people(pass.add(1))
  puts "-----------------------------\n|     CONTROL PANEL          |\n----------------------------- \n|     CHOOSE BUTTON          |\n|1 -  SELECT FLOOR           |\n|2 -  CLOSE DOOR             |\n|3 -  OPEN DOOR              |\n|4 -  CALL HELP              |\n-----------------------------"
  select_button = gets
  if select_button.to_i == 1
    print 'SELECT FLOOR : '
    select_floor = gets
    puts '-----------------------------'
    elevator.control.select_floor(select_floor.to_i)
  elsif select_button.to_i == 2
    elevator.control.door_close
    puts '[door close]'
  elsif select_button.to_i == 3
    elevator.control.door_open
    puts '[door open]'
  elsif select_button.to_i == 4
    elevator.control.call_help
  else
    'Wrong input!'
  end
  elevator.log_move('ins')
  elevator.free_people(1)
elsif mode.to_i == 2
  elevator.add_people(pass.add(5))
  elevator.control.select_floor(6)
  elevator.log_move

  puts "\n--------------------------"

  elevator.free_people(2)
  elevator.control.select_floor(2)
  elevator.log_move
else
  puts 'Wrong INPUT'
end

puts "\n--------------------------"
