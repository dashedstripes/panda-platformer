extends Node

var fsm = StateMachine

func enter():
	print('Attacking')
	fsm.back()

func exit(next_state):
	fsm.change_to(next_state)
