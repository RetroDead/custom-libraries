extends Node
class_name GearPause

var _pause : bool = false

func _ready():
	self.set_pause_mode(Node.PAUSE_MODE_PROCESS)

func set_pause(pause : bool) -> void:
	get_tree().set_pause(pause)

func get_paused() -> bool:
	return get_tree().is_paused()

func toggle_pause() -> void:
	get_tree().set_pause(!get_tree().is_paused())
