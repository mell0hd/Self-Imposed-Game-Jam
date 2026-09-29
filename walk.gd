class_name WalkState

extends PlayerState


@export var walk_speed := 80.0

func enter():
	print("entered walk state")
	animation.set("parameters/Locomotion/transition_request", "Walk")

func handle_input(event: InputEvent):
	var input_direction = Input.get_vector("turn_left","turn_right","move_forward","move_backward")
	if Input.is_anything_pressed():	
		print(input_direction)
		if input_direction.x < 0:
			print("left")
		else:
			print("right")
		if input_direction.y <0:
			animation.set("parameters/Walk Direction/transition_request", "Walk Forward")
		else:
			animation.set("parameters/Walk Direction/transition_request", "Walk Backward")
		if Input.is_action_just_pressed("run"):
			state_machine.change_state("runstate")
	elif Input.is_anything_pressed() == false:
		state_machine.change_state("idlestate")

func physics_update(delta: float):
	var input_direction = Input.get_axis("move_backward","move_forward")
	
	#basis.z is where-ever the character is facing at all times
	var walk_velocity = (player.basis.z * -1) * input_direction * walk_speed * delta
	player.velocity.x = walk_velocity.x
	player.velocity.z = walk_velocity.z
