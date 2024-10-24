extends Control
onready var _bg = $bg

func _physics_process(delta: float) -> void:
	_bg.color.h += 0.25 * delta

func _ready() -> void:
	_test_gear_lib_transition()

func _test_gear_lib_transition() -> void:
	yield(get_tree().create_timer(1.0,false),"timeout")
	GearLibTransitionScene.change_scene("res://scenes/non_library/main.tscn")
	
	if GearLibTransitionScene._DEBUG_TRANS_COUNT > 5: GearLibTransitionScene.fade_and_exit_program()
