extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# magnifier is pickup in second scene, so we need to check and set visibility
	# here to make sure the ItemStatusBar in every scene can be updated
	visible = Global.is_magnifier_pick_up
	
	Global.magnifier_pick_up.connect(_on_magnifier_pick_up)
	
func _on_magnifier_pick_up():
	visible = true
