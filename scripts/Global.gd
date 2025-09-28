extends Node

signal update_dialog_text(string : String)

var current_scene = null
var player_position_when_coming_inside=Vector2(2000,-189)
var player_coming_inside = false
var focus_on = false

signal magnifier_pick_up

enum SceneName {
	InDoor,
	OutDoor,
}

var current_scene_name := SceneName.InDoor

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("focus") and magnifier_pick_up:
		focus_on = not focus_on

var is_magnifier_pick_up := false:
	set(value):
		is_magnifier_pick_up = value
		if value == true:
			magnifier_pick_up.emit()

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(-1)

func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
