extends Node

var fsm = StateMachine

signal attack_finished

onready var animationPlayer = owner.get_node("AnimationPlayer")

func enter():
	animationPlayer.play("attack")

func exit(next_state):
	fsm.change_to(next_state)

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "attack"):
		emit_signal("attack_finished")
		exit("Idle")
