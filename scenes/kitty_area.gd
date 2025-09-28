extends Area2D
@onready var hovering_object : bool = false
@onready var zoom_in_0: Sprite2D = $"../../CanvasLayer/ZoomIn0"
@onready var meow: AudioStreamPlayer2D = $Kitty/Kitty/meow

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object and Global.is_magnifier_pick_up ==false:
		Global.update_dialog_text.emit(message_text)
		zoom_in_0.visible=true
		meow.play()
		
var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")
func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
