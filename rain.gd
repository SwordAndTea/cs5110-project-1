extends AudioStreamPlayer
	
func play_music(audio_stream: AudioStream, volume_db: float = 0):
	stream = audio_stream
	volume_db = volume_db
	play()

func stop_music():
	stop()
