extends Node
class_name ChirpLib

var _chirp_data : ChirpData = ChirpData.new()

func _init():
	# create audio busses | Add checks to see if the busses exist
	AudioServer.add_bus(0) # MUSIC BUS
	AudioServer.get_bus(1) # SOUND BUS

func play_sound(sound_request : ChirpSoundRequest) -> void:
	return

func play_music() -> void:
	return
