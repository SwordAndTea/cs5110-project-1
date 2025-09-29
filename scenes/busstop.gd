extends Node2D
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer
@onready var bus_2: AnimatedSprite2D = $Bus2
@onready var bus_leave: Area2D = $"Bus Leave"
@onready var rain: AnimatedSprite2D = $Background/Rain
@onready var rain_2: AnimatedSprite2D = $Background/Rain2
@onready var bus_leaving: AudioStreamPlayer2D = $"Bus Leaving"
@onready var right_boundary: CollisionShape2D = $"boundaries/right boundary"
@onready var magnifying: Area2D = $magnifying
@onready var animation_player: AnimationPlayer = $"fade in sun/AnimationPlayer"


func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")
	rain.play()
	rain_2.play()
	if Global.is_umbrella_pick_up==true:
		right_boundary.queue_free()
		animation_player.play("sunshine")
		rain.speed_scale = .5
		rain_2.speed_scale = .5

	if Global.did_bus_leave == true:
		bus_2.queue_free()
		bus_leave.queue_free()
		bus_leaving.queue_free()
	if Global.is_magnifier_pick_up == true:
		magnifying.queue_free()

func _on_inside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Global.player_coming_inside=true 
		scene_transition_animation.play("fadein")
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene("res://scenes/game.tscn")
		Global.current_scene_name = Global.SceneName.InDoor

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_magnifying_phase_2():
	print("here")

func _on_bus_leave_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bus_2.play()
		bus_leaving.play()
		Global.did_bus_leave = true
		await bus_2.animation_finished
		bus_2.queue_free()
		bus_leave.queue_free()
		await bus_leaving.finished 
		bus_leaving.queue_free()

func _on_end_game_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_transition_animation.play("fadein")
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene("res://scenes/credits.tscn")
