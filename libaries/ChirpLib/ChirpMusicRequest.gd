extends ChirpRequest
class_name ChirpMusicRequest

export var _music_to_play : int

#func _init() -> void:
#	set_repeat(true)

func set_music_to_play(music_to_play) -> void:
	_music_to_play = music_to_play

func get_music_to_play() -> int:
	return _music_to_play
