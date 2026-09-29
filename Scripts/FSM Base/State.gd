class_name State
extends Node

var state_machine: StateMachine

#Virtual methods that child states can override

func enter():
	pass

func exit():
	pass


#frame logic	
func update(delta: float):
	pass

#physics movement	
func physics_update(delta: float):
	pass
	
func handle_input(event: InputEvent):
	pass
