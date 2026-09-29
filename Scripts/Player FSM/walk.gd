class_name WalkState

extends PlayerState


@export var walk_speed := 100.0

func handleSteer(delta):
	var turn_speed = 110
	var turn_direction = Input.get_axis("turn_left","turn_right")
	player.rotation_degrees.y -= turn_direction * turn_speed * delta
	

func enter():
	print("entered walk state")
	animation.set("parameters/Locomotion/transition_request", "Walk")

func handle_input(event: InputEvent):
	var input_direction = Input.get_vector("turn_left","turn_right","move_forward","move_backward")
	if Input.is_anything_pressed():	
		if Input.is_action_just_pressed("move_backward") or Input.is_action_just_pressed("move_forward"):
			if Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
				state_machine.change_state("strafestate")
				print("strafe state being accessed")
		if input_direction.x < 0:
			pass
		else:
			pass
		if input_direction.y <0:
			animation.set("parameters/Walk Direction/transition_request", "Walk Forward")
		else:
			animation.set("parameters/Walk Direction/transition_request", "Walk Backward")
		if Input.is_action_just_pressed("run"):
			state_machine.change_state("runstate")
	elif Input.is_anything_pressed() == false:
		state_machine.change_state("idlestate")

func physics_update(delta: float):
	handleSteer(delta)
	var input_direction = Input.get_axis("move_backward","move_forward")
		
	
	var walk_velocity = (player.basis.z * -1) * input_direction * walk_speed * delta
	player.velocity.x = walk_velocity.x
	player.velocity.z = walk_velocity.z
	
	player.move_and_slide()
