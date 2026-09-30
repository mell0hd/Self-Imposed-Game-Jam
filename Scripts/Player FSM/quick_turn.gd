class_name QuickTurnState
extends PlayerState
var is_quick_turning = false
@export var quick_turn_speed: float = 0.8



func _on_tween_finished():
	is_quick_turning = false
	state_machine.change_state("idlestate")
	
func enter():
	print("entered quick turn state")
	if Input.is_action_pressed("run"):
		quick_turn_speed = 0.3
	else:
		quick_turn_speed = 0.7
	var _target_y_rotation = player.rotation.y + PI
	var tween = create_tween() as Tween
	animation.set("parameters/Locomotion/transition_request", "Turning")
	if not is_quick_turning:
		print(quick_turn_speed)
		tween.tween_property(player,"rotation:y", _target_y_rotation, quick_turn_speed)
		tween.finished.connect(func(): _on_tween_finished())

		
	

func handle_input(event: InputEvent):
	
	if is_quick_turning == false:
		if Input.is_action_just_pressed("turn_left") or Input.is_action_just_pressed("turn_right"):
			state_machine.change_state("turnstate")
		
			
		if Input.is_action_just_pressed("move_backward") or Input.is_action_just_pressed("move_forward"):
			if Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
				state_machine.change_state("strafestate")
			state_machine.change_state("walkstate")
		if Input.is_action_just_pressed("run"):
				state_machine.change_state("runstate")
	
func physics_update(delta: float):
	if is_quick_turning == true:	
		player.velocity = Vector3(0.0,0.0,0.0)
	
		player.move_and_slide()
