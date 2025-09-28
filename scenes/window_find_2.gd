extends Area2D
@onready var hovering_object : bool = false
@onready var zoom_in_3: Sprite2D = $"../../CanvasLayer/ZoomIn3"
@onready var window: AnimatedSprite2D = $"../../Interactive/Window Area/Window/Window"
@onready var magic: AudioStreamPlayer = $"../../magic"
@onready var window_find: Sprite2D = $"CollisionShape2D/window find"
@onready var window_found : bool = false
@onready var window_2: AnimatedSprite2D = $"../../Window 2"

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
	elif Global.is_magnifier_pick_up and window_found==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
		
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
	elif Global.is_magnifier_pick_up and window_found==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_3.visible=true
		window.play("color")
		window_2.play("color")
		magic.play()
		window_find.hide()
		window_found=true
		
	elif event.is_action_pressed("left_click") and hovering_object and window_found==true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_3.visible=true
		magic.play()
