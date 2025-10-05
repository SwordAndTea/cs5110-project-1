extends Area2D
@onready var hovering_object : bool = false
@onready var player: Player = $"../player"
@onready var rich_text_label: RichTextLabel = $"../CanvasLayer/RichTextLabel"
@onready var animation_player: AnimationPlayer = $"../SceneTransitionAnimation/AnimationPlayer"
@onready var endgame: AnimationPlayer = $"../endgame"
@onready var umbrella: AnimatedSprite2D = $"../player/umbrella"
@onready var rain_end: AnimationPlayer = $"../rain end"

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _ready():
	rich_text_label.visible = false

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		print ("help")
		endgame.play("end_animation")
		player.set_physics_process(false) 
		umbrella.stop() 
		rain_end.play()
		await endgame.animation_finished
		animation_player.play("slow_fade_out")
		await animation_player.animation_finished
		await get_tree().create_timer(0.5).timeout
		Global.goto_scene(Global.SceneName.Credits)
