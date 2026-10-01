class_name TurnState
extends PlayerState

@export var turn_speed := 100

func enter():
	
	print("entered turn state")
	
func handle_input(event: InputEvent):
	if Input.is_anything_pressed():
		if Input.is_action_pressed("run"):
			turn_speed = 140
			print(turn_speed)
		if not Input.is_action_pressed("run"):
			turn_speed = 100
			print(turn_speed)
	if Input.is_anything_pressed() == false:
	
		state_machine.change_state("idlestate")
	
func physics_update(delta: float):
	
	var turn_direction = Input.get_axis("turn_left","turn_right")
	player.rotation_degrees.y -= turn_direction * turn_speed * delta
	if Input.is_anything_pressed():
		if Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
			if turn_direction < 0:
				animation.set("parameters/Locomotion/transition_request", "Turning")
				animation.set("play_mode", "Backward")
			if turn_direction > 0:
				animation.set("parameters/Locomotion/transition_request", "Turning")
				animation.set("play_mode", "Forward")
		elif Input.is_action_pressed("move_forward"):
			state_machine.change_state("WalkState")
		elif Input.is_action_pressed("run"):
			state_machine.change_state("runstate")
		
