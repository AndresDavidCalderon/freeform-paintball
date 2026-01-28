@tool
extends CSGBox3D

@export var on_material:StandardMaterial3D
@export var off_material:StandardMaterial3D

@export var on=true:
	set=set_on

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Engine.is_editor_hint():
		Interactive.tried_to_pick.connect(on_tried_to_pick)
	

func set_on(new_on):
	on=new_on
	if on:
		collision_layer=7
		collision_mask=7
		material=on_material
	else:
		collision_layer=2
		collision_mask=2
		material=off_material

func on_tried_to_pick(intersection):
	if (not intersection.is_empty()) and intersection["collider"]==self:
		on=not on
