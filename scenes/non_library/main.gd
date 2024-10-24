extends Control



onready var _bg = $bg

func _physics_process(delta: float) -> void:
	_bg.color.h += 0.25 * delta

func _ready() -> void:
	_test_chirp()

func _test_chirp() -> void:
	var _chirp : ChirpLibCore
	_chirp = ChirpLibCore.new()
	add_child(_chirp)
	
	var t : ChirpMusicRequest = ChirpMusicRequest.new()
	t.set_music_to_play(ChirpData.MUSIC_ID.test_ice_cloud)

	var music_index : int = _chirp.play_music(t)
#	var pb_pos : float = 0.0
#	for i in INF:
#		yield(get_tree().create_timer(0.1,false),"timeout")
#
#		pb_pos = _chirp.pause_music(music_index)
#		yield(get_tree().create_timer(0.05,false),"timeout")
#		_chirp.resume_music(music_index,pb_pos)

