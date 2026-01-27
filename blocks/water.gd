extends Area3D

@export var mass_multiplier=1.2

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body):
	if body is RigidBody3D:
		body.gravity_scale=0.1
		body.mass*=mass_multiplier

func on_body_exited(body):
	if body is RigidBody3D:
		body.gravity_scale=1
		body.mass/=mass_multiplier
