class_name QuickTurnState
extends PlayerState
var is_quick_turning = false
@export var quick_turn_speed: float = 0.3

var timer: Timer = Timer.new()


func enter():
	print("entered quick turn state")
	print(lerp_angle)
	#timer.one_shot = true
	#timer.autostart = false
	#timer.wait_time = quick_turn_speed
	#add_child(timer)
	
	
func _on_timer_timeout():
	is_quick_turning = false
	state_machine.change_state("idlestate")
func physics_update(delta: float):

	if is_quick_turning == false:
		is_quick_turning = true
		#timer.start()
		print("lerppppp")
		
		var _target_y_rotation = player.rotation.y + PI
		lerp_angle(player.rotation.y, _target_y_rotation, quick_turn_speed * delta)
		
	#timer.timeout.connect(_on_timer_timeout)	
		
	if is_quick_turning == true:
		player.velocity = Vector3(0.0,0.0,0.0)
	player.move_and_slide()
