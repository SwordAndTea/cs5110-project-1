extends CollisionShape2D

@onready var hovering_object : bool = false
@onready var alarmclock: AnimatedSprite2D = $"."
 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering_object:
		alarmclock.play("clock")

func _on_mouse_entered() -> void:
	hovering_object = true
	
func _on_mouse_exited() -> void:
	hovering_object = false
