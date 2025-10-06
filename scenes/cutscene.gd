extends Node2D
@onready var rain: AnimatedSprite2D = $Background/Rain
@onready var rain_2: AnimatedSprite2D = $Background/Rain2
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer
@onready var bus_leaving: AudioStreamPlayer2D = $"Bus Leaving"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var itemget: AudioStreamPlayer = $itemget

@export var animation_player : AnimationPlayer
@export var autoplay : bool = false
@export var next_scene : PackedScene

func playTrack():
	bus_leaving.play()

func playTrack2():
	itemget.play()

var is_ready := false

func _enter_tree() -> void:
	if is_ready:
		_ready()

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("fade_out")
	rain.play()
	rain_2.play()
	Global.cutscene_done = true
	animated_sprite_2d.visible = false

#func _input(event):
	#if event.is_action_pressed("next") and not animation_player.is_playing():
		#animation_player.play()
		
func pause():
	if autoplay == false:
		animation_player.pause()

func change_scene():
	Global.goto_scene(Global.SceneName.Busstop)
