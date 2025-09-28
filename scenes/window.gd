extends TextureRect
var new_texture = preload("res://sprites/Fridge Opening.png") # Preload the new texture

@onready var hovering_object : bool = false
@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		Global.update_dialog_text.emit(message_text)
		
func _on_mouse_entered() -> void:
	hovering_object = true
	
func _on_mouse_exited() -> void:
	hovering_object = false
	
#func _input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
#		texture = Fridge Opening # Change the texture when clicked
