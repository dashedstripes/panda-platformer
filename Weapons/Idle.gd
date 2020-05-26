extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")

func enter():
	animationPlayer.play("idle")

func exit(next_state):
	fsm.change_to(next_state)
	
func physics_process(delta):
	if(Input.is_action_just_pressed("attack")):
		exit("Attack")
