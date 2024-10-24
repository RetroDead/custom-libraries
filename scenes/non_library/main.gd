extends Control



onready var _bg = $bg

func _physics_process(delta: float) -> void:
	_bg.color.h += 0.1 * delta

#func _ready() -> void:
#	_test_chirp()

func _test_chirp() -> void:
	var _chirp : ChirpLibCore
	_chirp = ChirpLibCore.new()
	add_child(_chirp)
	
	var t : ChirpMusicRequest = ChirpMusicRequest.new()
	t.set_music_to_play(ChirpData.MUSIC_ID.test_ice_cloud)

	var music_index : int = _chirp.play_music(t)
	
#	yield(get_tree().create_timer(2,false),"timeout")
	
	_chirp.stop_music(music_index)
	
