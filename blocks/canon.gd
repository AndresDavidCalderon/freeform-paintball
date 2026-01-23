extends Node3D

@export var default_light_energy=15
@export var explosion:PackedScene
@export var ray:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Interactive.tried_to_pick.connect(on_tried_to_pick)
	$Light.light_energy=0

func _unhandled_input(event: InputEvent) -> void:
	if Interactive.selected==self and event is InputEventMouse:
		var hit=Interactive.get_raycast_to_screen(event,1)
		if not hit.is_empty():
			look_at(hit["position"])
			if event.is_action_pressed("shoot_canon"):
				var new_exp=explosion.instantiate()
				add_child(new_exp)
				new_exp.global_position=hit["position"]
				var new_ray=ray.instantiate()
				add_child(new_ray)
				new_ray.shoot(global_position,hit["position"])
				
func on_tried_to_pick(intersection):
	if (not intersection.is_empty()) and intersection["collider"]==$Body:
		Interactive.set_selected(self)

func selected():
	$Light.light_energy=default_light_energy

func unselected():
	$Light.light_energy=0
