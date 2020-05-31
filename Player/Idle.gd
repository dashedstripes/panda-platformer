extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")

func enter():
	animationPlayer.play("idle")

func exit(next_state):
	fsm.change_to(next_state)

func physics_process(delta):
	if(Input.is_action_just_pressed("move_left") || Input.is_action_just_pressed("move_right")):
		exit("Run")
		
	if(Input.is_action_just_pressed("jump") && owner.is_on_floor()):
		exit("Jump")
		
	if(Input.is_action_just_pressed("attack")):
		exit("Idle Attack")
		
	owner.apply_gravity(delta)
	owner.apply_velocity(delta)
