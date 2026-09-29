class_name RunState

extends PlayerState

@export var run_speed := 280.0

func enter():
	print("entered run state")
	animation.set("parameters/Locomotion/transition_request", "Run")

func handle_input(event: InputEvent):
	var input_direction = Input.get_vector("turn_left","turn_right","move_forward","move_backward")
	if Input.is_anything_pressed() == true:	
		if Input.is_action_pressed("run"):
			if input_direction.x < 0:
				pass
			else:
				pass
			if input_direction.y <0:
				animation.set("parameters/Run Direction/transition_request", "Run Forward")
				
			else:
				animation.set("parameters/Run Direction/transition_request", "Run Backward")
		else:
			state_machine.change_state("walkstate")
	else:
		state_machine.change_state("idlestate")

func physics_update(delta: float):
	print("physics update called")
	var input_direction = Input.get_axis("move_backward","move_forward")
	
	#basis.z is where-ever the character is facing at all times
	var walk_velocity = (player.basis.z * -1) * input_direction * run_speed * delta
	player.velocity.x = walk_velocity.x
	player.velocity.z = walk_velocity.z
