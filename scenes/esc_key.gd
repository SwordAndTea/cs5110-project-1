extends Area2D
var pointer = load("res://sprites/pointer.png")
var clicker = preload("uid://btw3iel4apm6u")

func _on_mouse_entered() -> void:
	if Global.zoom_in==true:
		Input.set_custom_mouse_cursor(clicker)
		Global.hover=true

func _on_mouse_exited() -> void:
	if Global.zoom_in == true:
		Input.set_custom_mouse_cursor(pointer)
		Global.hover=false
