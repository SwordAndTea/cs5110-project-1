extends Sprite2D
@onready var zoom_in_4: Sprite2D = $"."
@onready var umbrella: Area2D = $"../.."

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		zoom_in_4.visible=false
		Global.zoom_in = false
