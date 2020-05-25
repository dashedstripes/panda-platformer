extends Node

var fsm = StateMachine

func enter():
	owner.velocity.y = -owner.jump

func exit(next_state):
	fsm.change_to(next_state)

func physics_process(delta):	
	if(owner.velocity.y > 0):
		exit("Fall")
	
	owner.apply_gravity(delta)	
	owner.apply_velocity(delta)
