extends Node2D

onready var sprite = get_child(0).get_node("Sprite")

func _physics_process(delta):
	if(owner.direction == Vector2.LEFT):
		print(sprite)
		sprite.flip_h = true
	if(owner.direction == Vector2.RIGHT):
		sprite.flip_h = false
