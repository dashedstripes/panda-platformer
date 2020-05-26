extends KinematicBody2D

onready var sprite = $AnimatedSprite

export var acceleration = 600
export var friction = 600
export var speed = 150
export var gravity = 1200
export var jump = 300

var velocity = Vector2.ZERO
var direction = Vector2.RIGHT
var input_velocity = Vector2.ZERO

func set_sprite_direction():
	if(direction == Vector2.LEFT):
		sprite.flip_h = true
	if(direction == Vector2.RIGHT):
		sprite.flip_h = false

func apply_gravity(delta):
	velocity.y += gravity * delta

func apply_velocity(delta):
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_movement(delta):
	input_velocity = Vector2.ZERO
	input_velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if(input_velocity.x > 0):
		direction = Vector2.RIGHT
	elif(input_velocity.x < 0):
		direction = Vector2.LEFT
		
	set_sprite_direction()

	if(input_velocity != Vector2.ZERO):
		velocity = velocity.move_toward(input_velocity * speed, delta * acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * friction)
