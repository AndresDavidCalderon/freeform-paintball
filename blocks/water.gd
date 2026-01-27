extends Area3D



func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body):
	if body is RigidBody3D:
		body.gravity_scale=0.1
		body.mass*=2

func on_body_exited(body):
	if body is RigidBody3D:
		body.gravity_scale=1
		body.mass/=2
