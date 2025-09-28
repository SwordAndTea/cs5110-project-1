extends Node2D
@onready var scene_transition_animation=$SceneTransitionAnimation/AnimationPlayer
@onready var rain: AnimatedSprite2D = $Rain
@onready var rain_2: AnimatedSprite2D = $Rain2

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")
@onready var player: CharacterBody2D = $player

func _on_outside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_transition_animation.play("fadein")
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene("res://scenes/busstop.tscn")

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")	
	rain.play()
	rain_2.play()
	if Global.player_coming_inside == true:
		player.position=Global.player_position_when_coming_inside
