-------------------Welcome to ELEVATOR SIMULATOR-------------------

Please input mode:
1 - Elevator-user
2 - Programmer
-------------------------------------------------------------------
1
On which floor are you?
4
-----------------------------
|     OUTSIDE DISPLAY       |
----------------------------- 
  Direction UP
  
  Floor 1 2 3 4
   
-----------------------------
Floor 4 [door open]

Floor 4 [total person] 0

-----------------------------
|     CONTROL PANEL          |
----------------------------- 
|     CHOOSE BUTTON          |

|1 -  SELECT FLOOR           |

|2 -  CLOSE DOOR             |

|3 -  OPEN DOOR              |

|4 -  CALL HELP              |

-----------------------------
1

SELECT FLOOR : 5

-----------------------------

Floor 4 [door open]

Floor 4 [total person] 1

Floor 4 [door close] direction UP

-----------------------------
|     INSIDE DISPLAY       |
----------------------------- 
  Speed 15
  
  Direction UP
  
  Weight 89
  
  Floor 4 5 
  
--------------------------

elevator.add_people(pass.add(5))

elevator.control.select_floor(6)
 
elevator.log_move

elevator.free_people(2)

elevator.control.select_floor(2)

elevator.log_move

-------------------Welcome to ELEVATOR SIMULATOR-------------------

Please input mode:

1 - Elevator-user
2 - Programmer
-------------------------------------------------------------------
2

Floor 1 [door open]

Floor 1 [total person] 5

Floor 1 [turn on second engine]

Floor 1 [door close] direction UP

--------------------------

Floor 6 [door open]

Floor 6 [total person] 3

Floor 6 [door close] direction DOWN

--------------------------