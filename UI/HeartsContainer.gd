extends Control

const draw_vector = Vector2(10, 10)
const margin = Vector2(20, 0)

var num_of_hearts = 10

export (Texture) var heart_texture setget _set_heart_texture

func _set_heart_texture(value):
	heart_texture = value
	update()

func _draw():
	for i in range(num_of_hearts):
		draw_set_transform(Vector2.ZERO, 0, Vector2(0.4, 0.4))
		draw_texture(heart_texture, draw_vector + margin * i)


func _on_Player_on_health_change(new_health):
	num_of_hearts = new_health
	update()
