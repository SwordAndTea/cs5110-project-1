extends Node2D
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer
@onready var rain: AnimatedSprite2D = $Background/Rain
@onready var rain_2: AnimatedSprite2D = $Background/Rain2
@onready var right_boundary: CollisionShape2D = $"boundaries/right boundary"
@onready var animation_player: AnimationPlayer = $"fade in sun/AnimationPlayer"
@onready var rich_text_label: RichTextLabel = $CanvasLayer/RichTextLabel
@onready var end_color: AnimationPlayer = $"end color"
@onready var ending_boundary: CollisionShape2D = $"boundaries/endbound"

var is_ready := false

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")
	rain.play()
	rain_2.play()
	#setting this automatically to true since player acquires magnifying glass during cutscene
	Global.is_magnifier_pick_up = true

	#adding a boundary for the end state so the player can't go back inside
	if Global.is_umbrella_pick_up== false: 
		get_node("boundaries/endbound").disabled = true
	if Global.is_umbrella_pick_up==true:
		get_node("boundaries/endbound").disabled=false
		
	if Global.is_umbrella_pick_up==true:
		if right_boundary:
			right_boundary.queue_free()
		animation_player.play("sunshine")
		rain.speed_scale = .5
		rain_2.speed_scale = .5
		end_color.play("colorglow")
		
	is_ready = true
func _enter_tree() -> void:
	if is_ready:
		_ready()

var has_triggered_switch_back_to_indoor_scene := false

func _on_inside_detect_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if not has_triggered_switch_back_to_indoor_scene:
			Global.player_coming_inside=true 
			scene_transition_animation.play("fadein")
			await get_tree().create_timer(0.5).timeout
			Global.goto_scene(Global.SceneName.InDoor)
			has_triggered_switch_back_to_indoor_scene = true

func _on_inside_detect_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		has_triggered_switch_back_to_indoor_scene = false

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

#func _on_end_game_body_entered(body: Node2D) -> void:
	#if body is CharacterBody2D:
		#scene_transition_animation.play("fadein")
		#await scene_transition_animation.animation_finished
		#await get_tree().create_timer(0.5).timeout
		#Global.goto_scene(Global.SceneName.Credits)
