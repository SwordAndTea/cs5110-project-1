extends Area2D
@onready var hovering_object : bool = false
@onready var fridge_anim: AnimatedSprite2D = $Fridge/FridgeAnim
@onready var fridge_sound: AudioStreamPlayer2D = $"Fridge/FridgeAnim/Fridge Sound"

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")
func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true
func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		Global.update_text.emit(message_text)
		fridge_anim.play("Open")
		fridge_sound.play()
