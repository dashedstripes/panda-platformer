extends Area2D

signal hit

func _on_Hitbox_area_entered(area):
	emit_signal("hit", area)
