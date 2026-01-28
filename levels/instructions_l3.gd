extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spring_activated() -> void:
	$Springs.hide()


func _on_magnet_2_switched(on: bool) -> void:
	if on:
		$Magnets.hide()


func _on_temporal_switched(on: bool) -> void:
	if not on:
		$Platforms.hide()
