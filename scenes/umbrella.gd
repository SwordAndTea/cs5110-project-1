extends Area2D
@onready var zoom_in_4: Sprite2D = $"../Umbrella/UmbrellaGet/ZoomIn4"
@onready var hovering_object : bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		zoom_in_4.visible=false
	
	if zoom_in_4.visible == true:
		if event.is_action_pressed("left_click") and hovering_object:
				Global.update_dialog_text.emit(message_text)
				if Global.is_umbrella_pick_up == false:
					print("update global is umbrella pick up")
					Global.is_umbrella_pick_up = true
	
@export_multiline var message_text : String = ""

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and zoom_in_4.visible == true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and zoom_in_4.visible == true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
