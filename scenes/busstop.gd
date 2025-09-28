extends Node2D
@onready var player: Player = $player
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer
@onready var bus_2: AnimatedSprite2D = $Bus2
@onready var bus_leave: Area2D = $"Bus Leave"
@onready var rain_2: AnimatedSprite2D = $Rain2
@onready var rain: AnimatedSprite2D = $Rain
@onready var bus_leaving: AudioStreamPlayer2D = $"Bus Leaving"

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")
	rain.play()
	rain_2.play()

func _on_inside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Global.player_coming_inside=true 
		scene_transition_animation.play("fadein")
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene("res://scenes/game.tscn")

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_magnifying_phase_2():
	print("here")

func _on_bus_leave_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bus_2.play()
		bus_leaving.play()
		await bus_2.animation_finished
		bus_2.queue_free()
		bus_leave.queue_free()
		await bus_leaving.finished 
		bus_leaving.queue_free()
