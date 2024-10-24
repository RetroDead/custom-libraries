# Preabmle
- These are just little godot libraries and frameworks I've made / am putting together to speed up my game development. Im choosing to make these public, as someone else may be able to get some value out of them.
- I am making these primarily for myself, so I fear they may be hard or confusing to use. I will try to provide some documentation, but for the most part instructions may be bare...
---

# Libraries

#### CHIRP Audio & Music Library 🕊️
- CHIRP is a simple library that handles all the audio needs for Godot games.
- The system is fairly straight forward.
-   create an instance of 'ChirpLibCore' as a globally available node (autoload/singleton)
-   create a 'ChirpRequest' object, and pass it into the appropriate method, either ChirpLibCore.play_sound(sound_request : ChirpSoundRequest) or ChirpLibCore.play_music(music_request : ChirpMusicRequest)
