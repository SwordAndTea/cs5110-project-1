extends Control

@onready var scene_transition_animation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer
@onready var setting_panel: SubViewportContainer = $SettingPanel

var master_bus_index : int

func _ready() -> void:
	master_bus_index = AudioServer.get_bus_index("Master")
	


func _on_start_game_button_pressed() -> void:
	scene_transition_animation.play("fadein")
	await scene_transition_animation.animation_finished
	await get_tree().create_timer(0.5).timeout
	Global.goto_scene(Global.SceneName.InDoor)


func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(value))


func _on_setting_button_pressed() -> void:
	setting_panel.visible = true


func _on_setting_panel_close_button_pressed() -> void:
	setting_panel.visible = false
