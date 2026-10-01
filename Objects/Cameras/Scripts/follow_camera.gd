class_name FollowCamera extends Camera3D

@export var follow_player := false
@onready var player: CharacterBody3D =$"../../../.."
@onready var target: Node3D = $"../../../../Target"


@export var FOV: float = 70
@export var Near: float = 0.05
@export var Far: float = 4000.0



func _ready() -> void:
	self.far = Far
	self.near = Near
	self.fov = FOV
func _physics_process(delta: float) -> void:
	
	if follow_player and player:
		look_at(target.global_position)


func _on_trigger_body_entered(body: Node3D) -> void:
	print("camera collision entered")
	if body is CharacterBody3D:
		current = true
		
