extends TextureRect

@onready var hovering_object : bool = false
@export var message_text : String = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		Global.update_dialog_text.emit(message_text)

func _on_mouse_enter() -> void:
	hovering_object = true

func _on_mouse_exited() -> void:
	hovering_object = false
