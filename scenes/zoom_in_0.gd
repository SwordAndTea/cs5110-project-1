extends Sprite2D
@onready var zoom_in_1: Sprite2D = $"."
@onready var hovering_object : bool = false
var pointer = load("res://sprites/pointer.png")
var clicker = preload("uid://btw3iel4apm6u")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		zoom_in_1.visible=false
