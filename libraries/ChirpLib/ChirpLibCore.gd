extends Node
class_name ChirpLibCore

var _chirp_data : ChirpLibData = ChirpLibData.new()
var _music_players : Array = []
const BUS_MUSIC : int = 0
const BUS_SFX : int = 1
const NONEXISTING_PLAYER : int = -1

func _init():
	# create audio busses | Add checks to see if the busses exist
	AudioServer.add_bus(BUS_MUSIC) # MUSIC BUS
	AudioServer.add_bus(BUS_SFX) # SOUND BUS
	AudioServer.set_bus_send(BUS_MUSIC,"Master")
	AudioServer.set_bus_send(BUS_SFX,"Master")
	AudioServer.set_bus_name(BUS_MUSIC,"Music")
	AudioServer.set_bus_name(BUS_SFX,"SFX")

# returns if the sound request is valid
func _is_sound_request_valid(sound_request : ChirpLibSoundRequest) -> bool:
	# dont play the _empty sound
	if sound_request.get_sound_to_play() == ChirpLibData.SOUND_ID._empty:     return false
	if not _chirp_data.SOUND_DICT.has(sound_request.get_sound_to_play()):  return false
	if _chirp_data.SOUND_DICT[sound_request.get_sound_to_play()] == "":    return false
	return true

# retusn if the music request if valid
func _is_music_request_valid(music_request : ChirpLibMusicRequest) -> bool:
	if music_request.get_music_to_play() == ChirpLibData.MUSIC_ID._empty:     return false
	if not _chirp_data.MUSIC_DICT.has(music_request.get_music_to_play()):  return false
	if _chirp_data.MUSIC_DICT[music_request.get_music_to_play()] == "":    return false
	return true

# plays a sound using a sound request object
func play_sound(sound_request : ChirpLibSoundRequest) -> void:
	if not _is_sound_request_valid(sound_request): return
		
	var _new_stream_player : AudioStreamPlayer = AudioStreamPlayer.new()
	var _new_audio_stream : AudioStream = load(_chirp_data.SOUND_DICT[sound_request.get_sound_to_play()])
	
	add_child(_new_stream_player)
	
	_new_stream_player.set_bus(AudioServer.get_bus_name(BUS_SFX))
	_new_stream_player.set_stream(_new_audio_stream)
	_new_stream_player.set_volume_db(sound_request.get_volume())
	
	var _pitch_range = rand_range(-sound_request.get_pitch_range(),sound_request.get_pitch_range())
	_new_stream_player.set_pitch_scale(sound_request.get_pitch() + _pitch_range)
	
	_new_stream_player.play()
	yield(_new_stream_player,"finished")
	_new_stream_player.queue_free()

# plays a sound using a music request object.
# RETURNS the index of the music player in the _music_players array
func play_music(music_request : ChirpLibMusicRequest) -> int:
	if not _is_music_request_valid(music_request): return NONEXISTING_PLAYER
	
	var _new_stream_player : AudioStreamPlayer = AudioStreamPlayer.new()
	var _new_audio_stream : AudioStream = load(_chirp_data.MUSIC_DICT[music_request.get_music_to_play()])
	
	add_child(_new_stream_player)
	
	_new_stream_player.set_bus(AudioServer.get_bus_name(BUS_MUSIC))
	_new_stream_player.set_stream(_new_audio_stream)
	_new_stream_player.set_volume_db(music_request.get_volume())
	
	var _pitch_range = rand_range(-music_request.get_pitch_range(),music_request.get_pitch_range())
	_new_stream_player.set_pitch_scale(music_request.get_pitch() + _pitch_range)
	
	
	_new_stream_player.play()
	var _new_stream_player_index : int = _add_music_player(_new_stream_player)
	return _new_stream_player_index

# stops a given music player in the _music_players array
func stop_music(music_player_index : int) -> void:
	if music_player_index == NONEXISTING_PLAYER: return
	var music_player = _get_music_player(music_player_index)
	music_player.queue_free()

# pauses the playback of a given music player in the _music_players array
# RETURNS where in playback the music player was when paused
func pause_music(music_player_index : int) -> float:
	if music_player_index == NONEXISTING_PLAYER: return 0.0
	var _music_player = _get_music_player(music_player_index)
	_music_player._set_playing(false)
	return _music_player.get_playback_position()

# resumes a given music player from the _music_players array given where to resume playback
func resume_music(music_player_index : int,playback_pos : float) -> void:
	if music_player_index == NONEXISTING_PLAYER: return
	var _music_player = _get_music_player(music_player_index)
	_music_player._set_playing(true)
	_music_player.seek(playback_pos)

# gets a music player from the _music_players array given an index
func _get_music_player(music_player_index : int) -> AudioStreamPlayer:
	return _music_players[music_player_index]

# adds a given music player to the _music_players array
func _add_music_player(music_player : AudioStreamPlayer) -> int:
	_music_players.append(music_player)
	return _music_players.find(music_player)
