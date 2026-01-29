extends Panel


func _ready() -> void:
	Progress.won.connect(on_won)
	hide()

func on_won():
	if Progress.current_level==Progress.levels.size()-1:
		show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
