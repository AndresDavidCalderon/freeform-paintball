extends Node3D

signal switched(on:bool)

@export var enabled:bool:
	set=set_enabled
@export var force=0.1
@export var enabled_material:StandardMaterial3D
@export var disabled_material:StandardMaterial3D
var light_force=1

func _ready() -> void:
	if not Engine.is_editor_hint():
		Interactive.tried_to_pick.connect(on_tried_to_pick)

func _physics_process(delta: float) -> void:
	if enabled and not Engine.is_editor_hint():
		for body in $InfluenceArea.get_overlapping_bodies():
			if body.is_in_group("balls"):
				body.apply_force(body.global_position.direction_to(global_position)*force)

func set_enabled(new_enabled):
	enabled=new_enabled
	if enabled:
		$Shape.material=enabled_material
		$OmniLight3D.light_energy=light_force
	else:
		$Shape.material=disabled_material
		$OmniLight3D.light_energy=0
	switched.emit(enabled)

func on_tried_to_pick(intersection):
	if (not intersection.is_empty()) and intersection["collider"]==$Pickable:
		print("Picked")
		set_enabled(not enabled)
