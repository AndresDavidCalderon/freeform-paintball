extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_levels_pressed() -> void:
	$LevelsList.show()
