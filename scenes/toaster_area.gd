extends Area2D
@onready var hovering_object : bool = false
@export_multiline var message_text : String = ""
@onready var burnt_toast: AnimatedSprite2D = $"Toaster/burnt toast"
@onready var toaster_sound: AudioStreamPlayer2D = $"Toaster/burnt toast/toaster sound"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object and Global.is_magnifier_pick_up ==false:
		Global.update_dialog_text.emit(message_text)
		burnt_toast.play("toast")
		toaster_sound.play()

var pointer = load("uid://bvcwntyc2p6yq")
var clicker = preload("uid://btw3iel4apm6u")
func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
