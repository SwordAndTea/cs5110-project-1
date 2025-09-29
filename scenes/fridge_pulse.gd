extends Area2D

@onready var hovering_object : bool = false
@onready var fridge_find: Area2D = $"../../Findables/fridge find"
@onready var fridge_find_glow: GPUParticles2D = $"CollisionShape2D/fridge find glow"

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=true
		fridge_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and fridge_find.has_signal("fridgefound")==true:
		hovering_object=false
		fridge_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=false
		fridge_find_glow.visible=false

	elif Global.is_magnifier_pick_up and fridge_find.has_signal("fridgefound")==true:
		hovering_object=false
		fridge_find_glow.visible=false
