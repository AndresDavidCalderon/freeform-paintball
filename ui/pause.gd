extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause()

func _on_resume_pressed() -> void:
	resume()

func resume():
	hide()
	get_tree().paused=false

func pause():
	show()
	get_tree().paused=true


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
