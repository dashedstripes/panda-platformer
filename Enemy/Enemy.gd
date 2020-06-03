extends Area2D

func _on_Enemy_area_entered(area):
	if(area.name == "Weapon"):
		queue_free()
