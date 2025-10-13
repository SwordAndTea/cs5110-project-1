extends CanvasLayer

@onready var label: Label = $Label
@export var timer: Timer 

func _ready() -> void:
	Global.update_dialog_text.connect(_update_text)
	if timer.get_parent()!=self or !timer:
		timer = Timer.new()
		timer.wait_time = 3.0
		timer.one_shot = true
		self.add_child(timer)
		print("help")

func _update_text(string : String):
	label.text = string
	timer.start()
	
func _process(_delta: float) -> void:
	if timer.is_stopped():
		label.text = ""
