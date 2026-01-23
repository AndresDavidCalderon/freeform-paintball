extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var idx=0
	for i in Progress.levels:
		idx+=1
		var new_button=Button.new()
		$FlowContainer.add_child(new_button)
		new_button.text=str(idx)
		new_button.pressed.connect(on_level_pressed.bind(idx-1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_level_pressed(level:int):
	Progress.set_level(level)
