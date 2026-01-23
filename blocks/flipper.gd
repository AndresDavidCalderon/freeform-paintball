extends Node3D

@export var force:float
@export var force_multiplier:float=1
@export var bumped:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Interactive.tried_to_pick.connect(on_tried_to_pick)

func _physics_process(delta: float) -> void:
	if bumped:
		$FlipperBody.apply_force(Vector3.UP*force*force_multiplier,$ForceCenter.position)

func on_tried_to_pick(intersection):
	if (not intersection.is_empty()) and intersection["collider"]==$FlipperBody:
		$AnimationPlayer.play("bump")
		print("Ckick")
