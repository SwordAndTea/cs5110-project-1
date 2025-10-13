extends TextureButton
var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
		Input.set_custom_mouse_cursor(clicker)

func _on_mouse_exited() -> void:
		Input.set_custom_mouse_cursor(pointer)
