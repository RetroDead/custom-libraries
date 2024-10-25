extends Control
onready var _bg = $bg

var _g : GearPause  = GearPause.new()
func _physics_process(delta: float) -> void:
	_bg.color.h += 3.25 * delta

func _ready() -> void:
#	add_child(_g)
	_test_gear_lib_transition()

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

var _gear_rng : GearRNG = GearRNG.new()
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

func _test_gear_lib_transition() -> void:
	yield(get_tree().create_timer(1.0,false),"timeout")
	GearLibTransitionScene.change_scene("res://scenes/non_library/main_2.tscn")

var _p : PearlLibCore = PearlLibCore.new()
func _test_pearl() -> void:
	_p.init_save_file()
	_p.get_save_file().set_value("something",1)
	print(_p.get_save_file().get_value("something"))
	
	for i in 100:
			_p.get_save_file().set_value(i,i)
	
	for i in 100:
		print(_p.get_save_file().get_value(i))
	
#	var _gear_rng_3 : GearLibRNG = GearLibRNG.new()
#	_gear_rng_3.set_seed(127)
#	_p.get_save_file().set_value("rng",_gear_rng_3)
	print(_p.get_save_file().get_value("rng").get_seed())
	_p.save_data()


func _test_gear_pause() -> void:
	
	
	for i in INF:
		yield(get_tree().create_timer(1,true),"timeout")
		_g.toggle_pause()
