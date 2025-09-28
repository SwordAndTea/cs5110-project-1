extends StaticBody2D
@onready var hovering_object : bool = false

signal look_close
var pickup = false
var look_close_zone
var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")


func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(clicker)
	hovering_object=true
pass # Replace with function body.
func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer)
	hovering_object=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
			if pickup == false:
				pickup = true
				$Sprite.queue.free()
	 
