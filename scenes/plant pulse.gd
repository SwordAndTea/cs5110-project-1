extends Area2D

@onready var hovering_object : bool = false
@onready var plant_find: Area2D = $"../../Findables/plant find"
@onready var plant_find_glow: GPUParticles2D = $"CollisionShape2D/plant find glow"


func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=true
		plant_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and plant_find.has_signal("plantfound")==true:
		hovering_object=false
		plant_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=false
		plant_find_glow.visible=false
