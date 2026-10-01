extends Path3D

@export var path_follow: PathFollow3D
@export var camera: ReCamera
var path_curve: Curve3D

@export var camera_distance_behind: float = 1.0
var follow_speed: float = 5

func _ready() -> void:
	path_curve = self.curve
func _physics_process(delta: float) -> void:
	if camera.player != null:
		var player_position = camera.player.global_position
		var closest_offset = path_curve.get_closest_offset(camera.player.global_position)
		var camera_offset = closest_offset - camera_distance_behind
		camera_offset = max(0.0, camera_offset)
	
		var curve_length = path_curve.get_baked_length()
		var target_ratio = camera_offset / curve_length if curve_length > 0 else 0.0
	
		path_follow.progress_ratio = lerp(
		path_follow.progress_ratio,
		target_ratio,
		follow_speed * delta
		)
