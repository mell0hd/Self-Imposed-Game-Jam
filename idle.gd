class_name IdleState
extends PlayerState


func enter():
	print("entered idle state")
	animation.set("parameters/Locomotion/transition_request", "Idle")
	
func handle_input(event: InputEvent):
	if Input.is_anything_pressed():
		if Input.is_action_just_pressed("move_backward") or Input.is_action_just_pressed("move_forward"):
			state_machine.change_state("walkstate")
		if Input.is_action_just_pressed("run"):
			state_machine.change_state("runstate")
			

			
