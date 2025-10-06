extends Area2D
@onready var umbrella_missing: Sprite2D = $"umbrelladots/umbrella missing"


func _on_body_entered(body: Node2D) -> void:
	if Global.is_magnifier_pick_up == false:
		umbrella_missing.visible = true
	
func _on_body_exited(body: Node2D) -> void:
	if Global.is_magnifier_pick_up == false:
		umbrella_missing.visible=false
	
