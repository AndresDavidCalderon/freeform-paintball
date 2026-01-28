extends Panel

@export var level_button:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	
	var idx=0
	for i in Progress.levels:
		idx+=1
		var new_button=level_button.instantiate()
		$FlowContainer.add_child(new_button)
		new_button.text=str(idx)
		new_button.pressed.connect(on_level_pressed.bind(idx-1))

func _process(delta: float) -> void:
	pass

func on_level_pressed(level:int):
	Progress.set_level(level)


func _on_close_pressed() -> void:
	hide()
