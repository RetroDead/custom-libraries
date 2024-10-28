extends Node

"PELASE EXTEND THIS BEFORE USING."

var _timer : Timer = Timer.new()
var _is_in_attack : bool = false
var _phase : int = 0

var _attack_list : Array = ["_attack"]
var _attack_index : int = 0

func _ready() -> void:
	add_child(_timer)
	_timer.connect("timeout",self,"_pick_attack")
	_timer.one_shot = false
	_timer.start(1)
	yield(VisualServer,"frame_post_draw")
	_timer.emit_signal("timeout")

# _pick_attack isnt REALLY virtual... but enemies with multiple attacks will need to reimplement it..

func _pick_attack() -> void:
	match _phase:
		0:
			_attack_list = ["_attack"]
	call_deferred(_attack_list[_attack_index])
	_increment_attack_index()

func _increment_attack_index() -> void:
	if _attack_index < _attack_list.size() - 1:
		_attack_index += 1
	else:
		_attack_index = 0

# _attack IS virtual. It is the default method called when no other attack is available.
# TL;DR - make a virtual method called _attack() and program your attack inside

func _attack() -> void:
	return

# -------- private

func get_phase() -> int:
	return _phase

func set_phase(phase : int) -> void:
	_phase = phase

func get_attack_index() -> int:
	return _attack_index

func set_attack_index(attack_index : int) -> void:
	_attack_index = attack_index

func get_attack_list() -> Array:
	return _attack_list

func set_attack_list(attack_list : Array ) -> void:
	_attack_list = attack_list
