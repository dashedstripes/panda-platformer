extends Node

class_name StateMachine

const DEBUG = true

var state = {}
var history = []

func _ready():
	state = get_child(0)
	_enter_state()
	
func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()
	
func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()
	
func _enter_state():
	if DEBUG:
		print("Entering state: ", state.name)
	state.fsm = self
	state.enter()

func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)
