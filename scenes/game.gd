extends Node2D
@onready var scene_transition_animation=$SceneTransitionAnimation/AnimationPlayer
@onready var rain: AnimatedSprite2D = $Rain
@onready var rain_2: AnimatedSprite2D = $Rain2
@onready var ringring: AudioStreamPlayer2D = $"Interactive/Alarm Area/Alarm/alarm clock/ringring"

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")
@onready var player: CharacterBody2D = $player

var is_ready := false

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")	
	rain.play()
	rain_2.play()
	is_ready = true

func _enter_tree() -> void:
	if is_ready:
		_ready()

var has_triggered_change_scene := false

func _on_outside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if not has_triggered_change_scene:
			scene_transition_animation.play("fadein")
			await get_tree().create_timer(0.5).timeout
			if Global.cutscene_done==false:
				Global.goto_scene(Global.SceneName.Cutscene)
				player.position = Global.player_position_when_coming_inside
				has_triggered_change_scene = true
			elif Global.cutscene_done==true:
					Global.goto_scene(Global.SceneName.Busstop)
					player.position = Global.player_position_when_coming_inside
					has_triggered_change_scene = true

func _on_outside_detect_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		has_triggered_change_scene = false
