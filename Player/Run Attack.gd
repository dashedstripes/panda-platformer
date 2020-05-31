extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")
onready var sprite = owner.get_node("AnimatedSprite")

func enter():
	animationPlayer.play("attack_run")
	
func exit(new_state):
	fsm.change_to(new_state)

func physics_process(delta):
	owner.apply_movement(delta)
	owner.apply_gravity(delta)
	owner.apply_velocity(delta)

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "attack_run"):
		fsm.back()
