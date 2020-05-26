extends Node2D

onready var sprite = get_child(0).get_node("Sprite")

func _physics_process(delta):
	if(owner.direction == Vector2.LEFT):
		sprite.flip_h = true
		sprite.position.x = -6
	if(owner.direction == Vector2.RIGHT):
		sprite.flip_h = false
		sprite.position.x = 0
