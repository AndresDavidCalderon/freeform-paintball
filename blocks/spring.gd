extends CSGCylinder3D
signal activated

@export var idle_material:StandardMaterial3D
@export var activated_material:StandardMaterial3D
@export var force=2
@export var shine_time=0.5
@export var shine_force=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("balls") and body is RigidBody3D:
		body.apply_impulse(global_transform.basis.y*force)
		activated.emit()
		material=activated_material
		$OmniLight3D.light_energy=shine_force
		await get_tree().create_timer(shine_time).timeout
		material=idle_material
		$OmniLight3D.light_energy=0
