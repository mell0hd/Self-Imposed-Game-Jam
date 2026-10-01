extends Path3D



var path_curve: Curve3D
var follow_speed: float = 5

@export var camera_distance_behind: float = 3.0

@onready var rail_camera: Path3D = $"."
@onready var path_follow_3d: PathFollow3D = $PathFollow3D
@export var camera: ReCamera

func _ready() -> void:
	path_curve = rail_camera.curve

func _physics_process(delta: float) -> void:
	
	
	if camera.player != null:

		var closest_offset = path_curve.get_closest_offset(camera.player.global_position)
		var camera_offset = closest_offset - camera_distance_behind
		camera_offset = max(0.0, camera_offset)
	
		var curve_length = path_curve.get_baked_length()
		var target_ratio = camera_offset / curve_length if curve_length > 0 else 0.0
	
		path_follow_3d.progress_ratio = lerp(
		path_follow_3d.progress_ratio,
		target_ratio,
		follow_speed * delta
		)
