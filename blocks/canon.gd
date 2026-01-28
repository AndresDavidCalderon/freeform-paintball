extends Node3D

@export var default_light_energy=15
@export var force=1
@export var explosion:PackedScene
@export var ray:PackedScene
@export var distance=1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Interactive.tried_to_pick.connect(on_tried_to_pick)
	$Light.light_energy=0

func _unhandled_input(event: InputEvent) -> void:
	if Interactive.selected==self and event is InputEventMouse:
		var hit=Interactive.get_raycast_to_screen(event,4)
		if not hit.is_empty():
			print("CLicked on",hit["collider"])
			look_at(hit["position"])
			if event.is_action_pressed("shoot_canon"):
				var space_state=get_world_3d().direct_space_state
				var from=$ShootPosition.global_position
				var end=from+from.direction_to(hit["position"])*distance
				var query=PhysicsRayQueryParameters3D.create(global_position,hit["position"],8)
				var intersection=space_state.intersect_ray(query)
				if not intersection.is_empty():
					print(intersection["collider"])
					var new_exp=explosion.instantiate()
					add_child(new_exp)
					new_exp.global_position=intersection["position"]
					var new_ray=ray.instantiate()
					add_child(new_ray)
					new_ray.shoot(from,intersection["position"])
					if intersection["collider"] is RigidBody3D:
						var collider:RigidBody3D=intersection["collider"]
						var offset=collider.global_position-intersection["position"]
						collider.apply_impulse(global_position.direction_to(intersection["position"])*force,offset)
				else:
					var new_ray=ray.instantiate()
					add_child(new_ray)
					new_ray.shoot(from,end)

func on_tried_to_pick(intersection):
	if (not intersection.is_empty()) and intersection["collider"]==$Body:
		Interactive.set_selected(self)

func selected():
	$Light.light_energy=default_light_energy

func unselected():
	$Light.light_energy=0
