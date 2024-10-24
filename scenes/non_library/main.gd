extends Control



onready var _bg = $bg

func _physics_process(delta: float) -> void:
	_bg.color.h += 0.25 * delta

func _ready() -> void:
	_test_gear_rng()

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

var _gear_rng : GearLibRNG = GearLibRNG.new()
func _test_gear_rng() -> void:
	
	_gear_rng.set_seed(0,0)
	for i in 10:
		
		print(_gear_rng.rng_check_chance(0.5))
	
	print("\n\n")
	
	var rng_2 : int = _gear_rng.add_rng_object()
	_gear_rng.set_seed(0 , rng_2)
	print("Does rng2 exist?: "+str(_gear_rng._does_rng_object_exist(rng_2)))
	print("\n\n")
	for i in 10:
		
		print(_gear_rng.rng_check_chance(0.5,rng_2))
	_gear_rng.remove_rng_object(rng_2)
	print("\n\n")
	print("Does rng2 exist?: "+str(_gear_rng._does_rng_object_exist(rng_2)))
