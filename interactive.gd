extends Node3D

var selected

signal tried_to_pick(intersection)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("activate_lever"):
		var intersection=get_raycast_to_screen(event)
		tried_to_pick.emit(intersection)

func get_raycast_to_screen(event:InputEvent,bitmask=2)->Dictionary:
	const RAY_LENGTH = 5000.0
	var camera = get_viewport().get_camera_3d()
	var ray_origin = camera.project_ray_origin(event.position)
	var ray_end = ray_origin + camera.project_ray_normal(event.position) * RAY_LENGTH
	
	var space_state = get_world_3d().direct_space_state
	var intersection = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(ray_origin, ray_end, bitmask))
	return intersection

func set_selected(new):
	if selected!=null:
		selected.unselected()
	new.selected()
	selected=new
