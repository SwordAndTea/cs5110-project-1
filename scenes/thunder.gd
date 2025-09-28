extends AudioStreamPlayer
func _process(_delta: float) -> void:
	if !$AudioStreamPlayer.playing: 
		$AudioStreamPlayer.play()
