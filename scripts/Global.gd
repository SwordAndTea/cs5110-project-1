extends Node

signal update_dialog_text(string : String)

var current_scene = null
var player_position_when_coming_inside=Vector2(2000,-189)
var player_coming_inside = false
var focus_on = false
var alarm = false
var did_bus_leave = false
var cutscene_done = false

signal magnifier_pick_up
signal umbrella_pick_up

var indoor_scene : Node
var busstop_scene := preload("res://scenes/busstop.tscn").instantiate()
var credits_scene := preload("res://scenes/credits.tscn").instantiate()
var cutscene := preload("res://scenes/cutscene.tscn").instantiate()

enum SceneName {
	InDoor,
	Busstop,
	Credits,
	Cutscene,
}

var current_scene_name := SceneName.InDoor

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("focus") and is_magnifier_pick_up:
		focus_on = not focus_on

var is_magnifier_pick_up := false:
	set(value):
		is_magnifier_pick_up = value
		if value == true:
			magnifier_pick_up.emit()
			
var is_umbrella_pick_up := false:
	set(value):
		is_umbrella_pick_up = value
		if value == true:
			umbrella_pick_up.emit()

func _ready():
	current_scene = get_tree().current_scene
	indoor_scene = current_scene # indoor scene is the default current scene when start the game
	
func goto_scene(scene_name: SceneName):
	#current_scene.free()
	#var s = ResourceLoader.load(path)
	#current_scene = s.instantiate()
	#get_tree().root.add_child(current_scene)
	#get_tree().current_scene = current_scene
	if current_scene:
		get_tree().root.remove_child(current_scene)
	if scene_name == SceneName.InDoor:
		get_tree().root.add_child(indoor_scene)
		current_scene = indoor_scene
		current_scene_name = SceneName.InDoor
	elif scene_name == SceneName.Busstop:
		get_tree().root.add_child(busstop_scene)
		current_scene = busstop_scene
		current_scene_name = SceneName.Busstop
	elif scene_name == SceneName.Credits:
		get_tree().root.add_child(credits_scene)
		current_scene = credits_scene
		current_scene_name = SceneName.Credits
	elif scene_name == SceneName.Cutscene:
		get_tree().root.add_child(cutscene)
		current_scene = cutscene
		current_scene_name = SceneName.Cutscene
	
