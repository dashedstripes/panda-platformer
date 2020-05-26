extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")

func enter():
	animationPlayer.play("jump")
	owner.velocity.y = -owner.jump

func exit(next_state):
	fsm.change_to(next_state)

func physics_process(delta):	
	if(owner.velocity.y > 100):
		exit("Fall")
		
	owner.apply_movement(delta)
	owner.apply_gravity(delta)	
	owner.apply_velocity(delta)
