extends Node
signal update_text(string : String)
signal phase2

var current_scene = null
var player_position_when_coming_inside=Vector2(2000,-189)
var player_coming_inside = false

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
