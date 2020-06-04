extends Node

export var current_health = 10

func add_health(amount):
	current_health += amount

func subtract_health(amount):
	current_health -= amount
