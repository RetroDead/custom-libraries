extends Resource
class_name ChirpData

# This class doesnt do anything, just holds info defined by the user

# -------- sound

enum SOUND_ID {
	# add your sounds here
	_empty
}

var SOUND_DICT : Dictionary = {
	# SOUND_ID.name : "ChirpData/<sound_name>
	SOUND_ID._empty : ""
}

# -------- music

enum MUSIC_ID {
	# add your music here
	_empty
}

var MUSIC_DICT : Dictionary = {
	MUSIC_ID._empty : ""
}
