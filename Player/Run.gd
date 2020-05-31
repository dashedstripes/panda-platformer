extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")
onready var sprite = owner.get_node("AnimatedSprite")

func enter():
	animationPlayer.play("run")
	
func exit(new_state):
	fsm.change_to(new_state)
	
func physics_process(delta):	
	owner.apply_movement(delta)
	
	if(owner.velocity == Vector2.ZERO && owner.input_velocity == Vector2.ZERO):
		exit("Idle")
	
	if(Input.is_action_just_pressed("jump") && owner.is_on_floor()):
		exit("Jump")
	
	if(Input.is_action_just_pressed("attack")):
		exit("Run Attack")
	
	owner.apply_gravity(delta)
	owner.apply_velocity(delta)
