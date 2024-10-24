extends Resource
class_name ChirpData

# This class doesnt do anything, just holds info defined by the user

# -------- sound

enum SOUND_ID {
	# add your sounds here
	_empty
	test_sound_bleep
	test_sound_unlock
}

var SOUND_DICT : Dictionary = {
	# SOUND_ID.name : "ChirpData/<sound_name>
	SOUND_ID._empty : "",
	SOUND_ID.test_sound_bleep : "res://libaries/ChirpLib/ChirpData/Sound/test_sound_bleep.ogg",
	SOUND_ID.test_sound_unlock : "res://libaries/ChirpLib/ChirpData/Sound/test_sound_unlock.ogg"
}

# -------- music

enum MUSIC_ID {
	# add your music here
	_empty
	test_ice_cloud
	test_red_ember
}

var MUSIC_DICT : Dictionary = {
	MUSIC_ID._empty : "",
	MUSIC_ID.test_ice_cloud : "res://libaries/ChirpLib/ChirpData/Music/0 ice cloud.wav",
	MUSIC_ID.test_red_ember : "res://libaries/ChirpLib/ChirpData/Music/3 dark red glow (boss a) demo 2.wav"
}
