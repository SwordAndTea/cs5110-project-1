extends Area2D
@onready var hovering_object : bool = false
@onready var magnifying: Area2D = $"."
@onready var inside_detect: Area2D = $"../InsideDetect"
@export_multiline var message_text : String = ""

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")


func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
			Global.update_dialog_text.emit(message_text)
			if Global.is_magnifier_pick_up == false:
				print("update global is magnifier pick up")
				Global.is_magnifier_pick_up = true
				magnifying.hide()
