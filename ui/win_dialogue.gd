extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Progress.won.connect(on_won)
	hide()

func on_won():
	show()


func _on_button_pressed() -> void:
	Progress.set_level()
