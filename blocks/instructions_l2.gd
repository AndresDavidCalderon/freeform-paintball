extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Interactive.connect("selected_changed",on_selection)
	$ShootBall.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_selection(_old,_new):
	$SelectCanon.hide()
	$ShootBall.show()
