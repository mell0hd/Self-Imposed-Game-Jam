class_name WalkStrafeState
extends PlayerState

func enter():
	print("entered walk strafe state")
	print("you made a wrong turn, better go back before you get lost")
	state_machine.change_state("idlestate")
	
	
	
func handle_input(event: InputEvent):
	if Input.is_anything_pressed() == false:
		state_machine.change_state("idlestate")
	#var input_direction = Input.get_vector("turn_left","turn_right","move_forward","move_backward")
	#if Input.is_action_pressed("move_forward") and Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_left"):	
			#animation.set("parameters/Walk Direction/transition_request", "Walk Strafe Left")
	#elif Input.is_action_pressed("move_forward") and Input.is_action_pressed("turn_right") or Input.is_action_pressed("move_backward") and Input.is_action_pressed("turn_right"):	
			#animation.set("parameters/Walk Direction/transition_request", "Walk Strafe Right")
			#
	#if Input.is_anything_pressed() == false:
		#state_machine.change_state("idlestate")
	#elif Input.is_action_just_pressed("move_backward") or Input.is_action_just_pressed("move_forward"):
		#state_machine.change_state("walkstate")
	#elif Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
		#state_machine.change_state("turnstate")

	
