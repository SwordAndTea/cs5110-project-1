extends Area2D
@onready var hovering_object : bool = false
@onready var fridge_anim: AnimatedSprite2D = $Fridge/FridgeAnim
@onready var fridge_sound: AudioStreamPlayer2D = $"Fridge/FridgeAnim/Fridge Sound"

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

var is_fridge_open = false

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up == false:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up == false and event.is_action_pressed("left_click") and hovering_object:
		if not is_fridge_open:
			Global.update_dialog_text.emit(message_text)
			fridge_anim.play("open_without_close")
			fridge_sound.play()
			is_fridge_open = true
		else:
			Global.update_dialog_text.emit("")
			fridge_anim.play("closed")
			is_fridge_open = false
