extends Node2D
@onready var player: Player = $player
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer
@onready var rain: AnimatedSprite2D = $Rain
@onready var rain_2: AnimatedSprite2D = $Rain2

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")
	rain.play("rain")
	rain_2.play("rain")


func _on_inside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Global.player_coming_inside=true 
		scene_transition_animation.play("fadein")
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene("res://scenes/game.tscn")
		print(player.position)


var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_magnifying_phase_2():
	print("here")
