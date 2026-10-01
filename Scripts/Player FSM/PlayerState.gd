class_name PlayerState
extends CharacterBody3D

var state_machine: PlayerStateMachine
@onready var player = $"../.."
@onready var animation: AnimationTree = $"../../Model/AnimationTree"


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
