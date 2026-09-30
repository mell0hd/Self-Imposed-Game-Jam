extends CharacterBody3D

func _physics_process(delta: float) -> void:
	
	var quick_turn_speed = 0.3
	var _target_y_rotation = rotation.y + PI
		
	lerpf(self.rotation.y, _target_y_rotation, quick_turn_speed * delta)
