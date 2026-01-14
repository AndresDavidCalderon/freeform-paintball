extends Node3D

@export var force:float
@export var force_multiplier:float=1
@export var bumped:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if bumped:
		$FlipperBody.apply_force(Vector3.UP*force*force_multiplier,$ForceCenter.position)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("activate_lever"):
		const RAY_LENGTH = 5000.0
		var camera = get_viewport().get_camera_3d()
		var ray_origin = camera.project_ray_origin(event.position)
		var ray_end = ray_origin + camera.project_ray_normal(event.position) * RAY_LENGTH
		
		var space_state = get_world_3d().direct_space_state
		var intersection = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(ray_origin, ray_end, 2))
		if (not intersection.is_empty()) and intersection["collider"]==$FlipperBody:
			$AnimationPlayer.play("bump")
			print("Ckick")
