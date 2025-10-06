extends Area2D

@onready var hovering_object : bool = false
@onready var toaster_find: Area2D = $"../../Findables/toaster find"
@onready var toaster_find_glow: GPUParticles2D = $"CollisionShape2D/toaster find glow"

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=true
		toaster_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and toaster_find.has_signal("toasterfound")==true:
		hovering_object=false
		toaster_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=false
		toaster_find_glow.visible=false

	elif Global.is_magnifier_pick_up and toaster_find.has_signal("toasterfound")==true:
		hovering_object=false
		toaster_find_glow.visible=false
