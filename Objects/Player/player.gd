extends CharacterBody3D

@onready var camera: Node3D = $Camera_Controller
@export var follow_speed = 2
func _physics_process(delta: float) -> void:
	#make camera controller match position of self
	pass
	
	
	camera.position = lerp(camera.position, self.position, follow_speed * delta)
	
	
	
