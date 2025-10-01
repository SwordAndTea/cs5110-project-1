extends Node2D
@onready var scene_transition_animation= $SceneTransitionAnimation/AnimationPlayer

func _ready():
	scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	scene_transition_animation.play("slow_fade")
