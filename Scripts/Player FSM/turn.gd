class_name TurnState
extends PlayerState

@export var turn_speed := 100

func enter():
	print("entered turn state")
	
func handle_input(event: InputEvent):
	if Input.is_anything_pressed() == false:
		state_machine.change_state("idlestate")

func physics_update(delta: float):
	var turn_direction = Input.get_axis("turn_left","turn_right")
	player.rotation_degrees.y -= turn_direction * turn_speed * delta

	if turn_direction < 0:
		animation.set("parameters/Locomotion/transition_request", "Turning")
		animation.set("play_mode", "Backward")
	if turn_direction > 0:
		animation.set("parameters/Locomotion/transition_request", "Turning")
		animation.set("play_mode", "Forward")
	
