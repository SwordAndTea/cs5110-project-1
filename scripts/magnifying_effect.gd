extends Sprite2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("focus"):
		if !visible and Global.is_magnifier_pick_up:
			position = get_global_mouse_position()
			visible = true
		elif visible:
			visible = false
		
	elif event is InputEventMouseMotion:
		position = get_global_mouse_position()
	
