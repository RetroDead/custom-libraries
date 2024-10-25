"""

# Chirp is an audio / music manager / library for Godot 3.5.1

How to use Chirp?

Adding an audio file
- Chirp supports whatever audio files can be run in Godot via the AudioStream class
- In the file ChirpData, a new entry in the enum SOUND_ID ( or MUSIC_ID for music ) must be made
- Now a new entry in the dictionary SOUND_DICT (MUSIC_DICT) music be made. The key is the new enum entry, and the value is the path to the sound / music File
-- (A folder named ChirpData exists as a freely available place to but these audio files)

How to play the audio file

- An instance of Chirp must be created
'var _chirp : ChirpLibCore = ChirpLibCore.new()'
	- Instancing Chirp in an autoload would be best for most use cases

- Now, a request of the corresponding type must be made. If playing a sound, use the ChirpSoundRequest. Use ChirpMusicRequest for music
'var request : ChirpSoundRequest my_request = ChirpSoundRequest.new()'

- At this stage, any of the requests variables can be changed to change the behavior of the sound.

- Use the following methods to play your audio file
_chirp.play_sound(my_request) -> void
var my_music_player_index : int = _chirp.play_music(my_request) -> int ( returns the index of the music player. Keep track of this value when planning to stop a song)

- This is all for sound effects. Music has the following things to consider
_chirp.stop_music(my_music_player_index) -> void  will delete the music player
_chirp.pause_music(my_music_player_index) -> void  will pause the music player
_chirp.resume_music(my_music_player_index) -> void  will resume the music player



"""
