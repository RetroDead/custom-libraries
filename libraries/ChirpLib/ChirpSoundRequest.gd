extends ChirpRequest
class_name ChirpSoundRequest

export var _sound_to_play : int

# --------

func set_sound_to_play(sound_to_play) -> void:
	_sound_to_play = sound_to_play

func get_sound_to_play() -> int:
	return _sound_to_play
