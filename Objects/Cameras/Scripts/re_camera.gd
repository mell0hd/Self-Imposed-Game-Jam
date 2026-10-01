class_name ReCamera extends Camera3D

@export var follow_player := false
var player: CharacterBody3D = null

@export var FOV: float = 70
@export var Near: float = 0.05
@export var Far: float = 4000.0

func _ready() -> void:
	self.far = Far
	self.near = Near
	self.fov = FOV
func _physics_process(delta: float) -> void:
	
	if follow_player and player:
		look_at(player.global_position)


func _on_trigger_body_entered(body: Node3D) -> void:
	print("camera collision entered")
	if body is CharacterBody3D:
		player = body
		#this switches camera because there can only be one current camera 
		current = true
		
