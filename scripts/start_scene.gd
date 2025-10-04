extends Control

@onready var scene_transition_animation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer


func _on_texture_button_pressed() -> void:
	scene_transition_animation.play("fadein")
	await scene_transition_animation.animation_finished
	await get_tree().create_timer(0.5).timeout
	Global.goto_scene(Global.SceneName.InDoor)
