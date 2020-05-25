extends KinematicBody2D

export var acceleration = 600
export var friction = 600
export var speed = 150
export var gravity = 1200
export var jump = 300

var velocity = Vector2.ZERO
var direction = Vector2.RIGHT

func apply_gravity(delta):
	velocity.y += gravity * delta

func apply_velocity(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
