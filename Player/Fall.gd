extends Node

var fsm = StateMachine

func enter():
	
	pass

func exit(next_state):
	fsm.change_to(next_state)

func physics_process(delta):
	if(owner.velocity.y == 0):
		exit("Run")
	
	owner.apply_gravity(delta)
	owner.apply_velocity(delta)
