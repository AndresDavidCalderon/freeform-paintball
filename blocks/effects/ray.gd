extends Node3D

var to
var from

func shoot(from:Vector3,to:Vector3):
	$Path3D.curve=Curve3D.new()
	$Path3D.curve.add_point(from)
	$Path3D.curve.add_point(to)
	await get_tree().create_timer(0.2).timeout
	queue_free()

func _process(delta: float) -> void:
	global_position=Vector3.ZERO
	global_rotation=Vector3.ZERO
