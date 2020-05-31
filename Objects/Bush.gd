extends Area2D

func _on_Bush_area_entered(area):
	print(area.name)
	queue_free()
	
	
