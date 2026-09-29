class_name IdleState
extends PlayerState


func enter():
	print("entered idle state")
	animation.set("parameters/Locomotion/transition_request", "Idle")
	
func handle_input(event: InputEvent):
		if Input.is_action_just_pressed("quick_turn"):
			state_machine.change_state("quickturnstate")
		if Input.is_action_just_pressed("turn_left") or Input.is_action_just_pressed("turn_right"):
			state_machine.change_state("turnstate")
		
			
		if Input.is_action_just_pressed("move_backward") or Input.is_action_just_pressed("move_forward"):
			if Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
				state_machine.change_state("strafestate")
			state_machine.change_state("walkstate")
		if Input.is_action_just_pressed("run"):
				state_machine.change_state("runstate")
		
		

		
