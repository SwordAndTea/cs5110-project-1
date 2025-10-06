extends Area2D

@onready var hovering_object : bool = false
@onready var journal_find: Area2D = $"../../Findables/journal find"
@onready var journal_find_glow: GPUParticles2D = $"CollisionShape2D/journal find glow"

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=true
		journal_find_glow.visible=true
		
	elif Global.is_magnifier_pick_up and journal_find.has_signal("journalfound")==true:
		hovering_object=false
		journal_find_glow.visible=false

func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		hovering_object=false
		journal_find_glow.visible=false

	elif Global.is_magnifier_pick_up and journal_find.has_signal("journalfound")==true:
		hovering_object=false
		journal_find_glow.visible=false
