extends Area2D

@onready var hovering_object : bool = false
@onready var kitty_find: Area2D = $"../../Findables/kitty find"
@onready var kitty_find_glow: GPUParticles2D = $"CollisionShape2D/kitty find glow"

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true and Global.current_scene_name ==Global.SceneName.InDoor:
		hovering_object=true
		kitty_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and kitty_find.has_signal("kittyfound")==true:
		hovering_object=false
		kitty_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true and Global.current_scene_name ==Global.SceneName.InDoor:
		hovering_object=false
		kitty_find_glow.visible=false

	elif Global.is_magnifier_pick_up and kitty_find.has_signal("kittyfound")==true:
		hovering_object=false
		kitty_find_glow.visible=false
