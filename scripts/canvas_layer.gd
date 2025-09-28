extends CanvasLayer

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

func _ready() -> void:
	Global.update_dialog_text.connect(_update_text)
	
func _update_text(string : String):
	label.text = string
	timer.start()
	
func _process(delta: float) -> void:
	if timer.is_stopped():
		label.text = ""
