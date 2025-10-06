extends Area2D

@onready var hovering_object : bool = false
@onready var window_find: Area2D = $"../../Findables/window find"
@onready var window_find_glow: GPUParticles2D = $"CollisionShape2D/window find glow"

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true and Global.current_scene_name ==Global.SceneName.InDoor:
		hovering_object=true
		window_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and window_find.has_signal("windowfound")==true:
		hovering_object=false
		window_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true and Global.current_scene_name ==Global.SceneName.InDoor:
		hovering_object=false
		window_find_glow.visible=false

	elif Global.is_magnifier_pick_up and window_find.has_signal("windowfound")==true:
		hovering_object=false
		window_find_glow.visible=false
