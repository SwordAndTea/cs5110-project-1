extends Area2D
@onready var hovering_object : bool = false
@export_multiline var message_text : String = ""
@onready var zoom_in_1: Sprite2D = $"../../CanvasLayer/ZoomIn1"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		Global.update_dialog_text.emit(message_text)
		zoom_in_1.visible=true

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")
func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true
func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false
