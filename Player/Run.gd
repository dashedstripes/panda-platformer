extends Node

var fsm = StateMachine

onready var animationPlayer = owner.get_node("AnimationPlayer")
onready var sprite = owner.get_node("AnimatedSprite")

func enter():
	animationPlayer.play("run_right")
	
func exit(new_state):
	fsm.change_to(new_state)
	
func set_sprite_direction():
	if(owner.direction == Vector2.LEFT):
		sprite.flip_h = true
	if(owner.direction == Vector2.RIGHT):
		sprite.flip_h = false
	
func physics_process(delta):
	
	var input_velocity = Vector2.ZERO
	input_velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if(owner.velocity == Vector2.ZERO && input_velocity == Vector2.ZERO):
		exit("Idle")
	
	if(input_velocity.x > 0):
		owner.direction = Vector2.RIGHT
	elif(input_velocity.x < 0):
		owner.direction = Vector2.LEFT
		
	set_sprite_direction()
	
	if(Input.is_action_just_pressed("jump") && owner.is_on_floor()):
		exit("Jump")

	if(input_velocity != Vector2.ZERO):
		owner.velocity = owner.velocity.move_toward(input_velocity * owner.speed, delta * owner.acceleration)
	else:
		owner.velocity = owner.velocity.move_toward(Vector2.ZERO, delta * owner.friction)
		
	owner.apply_gravity(delta)
	owner.apply_velocity(delta)
