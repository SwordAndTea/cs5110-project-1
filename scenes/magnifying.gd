extends Area2D
@onready var hovering_object : bool = false
@onready var magnifying: Area2D = $"."
@onready var inside_detect: Area2D = $"../InsideDetect"
@export_multiline var message_text : String = ""

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

var pickup = false

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
			Global.update_text.emit(message_text)
			if pickup == false:
				pickup = true
				magnifying.hide()
				Global.phase2.emit()


func _on_bus_stop_phase_2() -> void:
	pass # Replace with function body.
