extends Resource
class_name ChirpRequest

# Holds info about what to play

export var _volume : float
export var _pitch : float = 1.0
export var _pitch_range : float = 0.0
#export var _repeat : bool = false

# -------- setters

func set_volume(volume : float) -> void:
	self._volume = volume

func set_pitch(pitch : float) -> void:
	self._pitch = pitch

func set_pitch_range(pitch_range : float) -> void:
	self._pitch_range = pitch_range

#func set_repeat(repeat : bool) -> void:
#	self._repeat = repeat

# -------- getters

func get_volume() -> float:
	return _volume

func get_pitch() -> float:
	return _pitch

func get_pitch_range() -> float:
	return _pitch_range

#func get_repeat() -> bool:
#	return _repeat
