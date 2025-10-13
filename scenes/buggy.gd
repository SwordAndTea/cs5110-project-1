extends Area2D

@onready var hovering_object : bool = false
@onready var buggy: Area2D = $"."
@onready var bug_find_glow: GPUParticles2D = $"CollisionShape2D/bug find glow"
@onready var ladybug: Sprite2D = $CollisionShape2D/ladybug
@onready var magic: AudioStreamPlayer = $"../magic"
@onready var zoom_in_7: Sprite2D = $"../../CanvasLayer/ZoomIn7"
var pointer = load("res://sprites/pointer.png")
var clicker = preload("uid://btw3iel4apm6u")
var bugfound = false

@export_multiline var message_text : String = ""

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=true
		bug_find_glow.visible=true
		Input.set_custom_mouse_cursor(clicker)

	elif Global.is_magnifier_pick_up and bugfound==true:
		hovering_object=true
		bug_find_glow.visible=false
		Input.set_custom_mouse_cursor(clicker)

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=false
		bug_find_glow.visible=false

	elif Global.is_magnifier_pick_up and bugfound==true:
		hovering_object=false
		bug_find_glow.visible=false

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		magic.play()
		zoom_in_7.visible=true
		ladybug.visible = true
		bugfound=true
	
	elif event.is_action_pressed("left_click") and hovering_object and bugfound==true:
		Global.update_dialog_text.emit(message_text)
		magic.play()
		zoom_in_7.visible=true
