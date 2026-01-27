extends RigidBody3D

var reset:=false
var original_transform:Transform3D

func _ready() -> void:
	original_transform=Transform3D(transform)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	reset=true
	print("resetting")

	
func _integrate_forces(state):
	if reset:
		state.linear_velocity=Vector3.ZERO
		state.angular_velocity=Vector3.ZERO
		reset = false
