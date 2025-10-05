extends Area2D
@onready var hovering_object : bool = false
@onready var burnt_toast: AnimatedSprite2D = $"../../Interactive/Toaster Area/Toaster/burnt toast"
@onready var magic: AudioStreamPlayer = $"../../magic"
@onready var toaster_found : bool = false
@onready var toaster_sound: AudioStreamPlayer2D = $"../../Interactive/Toaster Area/Toaster/burnt toast/toaster sound"

signal toasterfound

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
	elif Global.is_magnifier_pick_up and toaster_found==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
		
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

	elif Global.is_magnifier_pick_up and toaster_found==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		toaster_sound.play()
		burnt_toast.play("goodtoast")
		toaster_found=true
		toasterfound.emit()
	
	elif event.is_action_pressed("left_click") and hovering_object and toaster_found==true:
		Global.update_dialog_text.emit(message_text)
		toaster_sound.play()
