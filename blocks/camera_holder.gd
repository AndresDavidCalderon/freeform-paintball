@tool
extends Node3D


var sensitivity=0.01
@export var vertical=0
@export var horizontal=0
# Called when the node enters the scene tree for the first time.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("lock_mouse"):
		Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	if event.is_action_released("lock_mouse"):
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion and Input.is_action_pressed("lock_mouse") and not Engine.is_editor_hint():
		vertical+=event.relative.y*sensitivity
		horizontal+=event.relative.x*sensitivity
		
		vertical=clamp(vertical,-PI/2,PI/2)
		horizontal=clamp(horizontal,-PI/2,PI/2)
		
		rotation=Vector3.ZERO
		global_rotate(Vector3(0,1,0),horizontal)
		global_rotate(Vector3(1,0,0),vertical)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().global_rotation=Vector3.ZERO
	if Engine.is_editor_hint():
		rotation=Vector3.ZERO
		global_rotate(Vector3(0,1,0),horizontal)
		global_rotate(Vector3(1,0,0),vertical)
