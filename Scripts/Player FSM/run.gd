class_name RunState

extends PlayerState

@export var run_speed := 280.0
func handleSteer(delta):
	var turn_speed = 180
	var turn_direction = Input.get_axis("turn_left","turn_right")
	player.rotation_degrees.y -= turn_direction * turn_speed * delta

func enter():
	print("entered run state")
	animation.set("parameters/Run Direction/transition_request", "Run Forward")
	

func handle_input(event: InputEvent):
	var input_direction = Input.get_vector("turn_left","turn_right","move_forward","move_backward")
	
	if Input.is_anything_pressed() == true:	
		if Input.is_action_just_pressed("quick_turn"):
			state_machine.change_state("quickturnstate")
		if Input.is_action_pressed("run"):
			
			if input_direction.y <0 and Input.is_action_pressed("move_forward"):
				animation.set("parameters/Locomotion/transition_request", "Run")
				animation.set("parameters/Run Direction/transition_request", "Run Forward")
				
			if input_direction.y > 0 and Input.is_action_pressed("move_backward"):
				animation.set("parameters/Locomotion/transition_request", "Run")
				animation.set("parameters/Run Direction/transition_request", "Run Backward")
		
	else:
		state_machine.change_state("idlestate")
	
	
func physics_update(delta: float):
	handleSteer(delta)
	var input_direction = Input.get_axis("move_backward","move_forward")
	
	#basis.z is where-ever the character is facing at all times
	var walk_velocity = (player.basis.z * -1) * input_direction * run_speed * delta
	player.velocity.x = walk_velocity.x
	player.velocity.z = walk_velocity.z
	
	
	if player.velocity == Vector3(0.0,0.0,0.0):
			animation.set("parameters/Locomotion/transition_request", "Idle")
	if player.velocity == Vector3(0.0,0.0,0.0) and Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right") and not Input.is_action_pressed("run"):
			state_machine.change_state("turnstate")
	player.move_and_slide()
