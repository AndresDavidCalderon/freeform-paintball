extends Node

signal won

var levels=[
	"res://levels/level1.tscn",
	"res://levels/level2.tscn",
	"res://levels/level3.tscn"
]
var current_level=0

func set_level(new_level=-1):
	if new_level==-1:
		new_level=current_level+1
	current_level=new_level
	if current_level<levels.size():
		get_tree().change_scene_to_file(levels[current_level])
	else:
		printerr("Invalid level")

func win():
	won.emit()
