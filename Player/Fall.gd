extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")

func enter():
	animationPlayer.play("fall")

func exit(next_state):
	fsm.change_to(next_state)

func physics_process(delta):			
	if(owner.velocity.y == 0):
		exit("Run")
		
	if(Input.is_action_just_pressed("attack")):
		exit("Idle Attack")
	
	owner.apply_movement(delta)
	owner.apply_gravity(delta)	
	owner.apply_velocity(delta)
