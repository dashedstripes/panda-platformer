extends Label

onready var player = owner.get_node("Player")

func _ready():
	text = "Health: " + str(player.health.current_health)

func _on_Player_on_health_change(new_health):
	text = "Health: " + str(new_health)
