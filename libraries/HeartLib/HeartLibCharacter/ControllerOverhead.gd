extends "res://libraries/HeartLib/HeartLibCharacter/CharacterBase.gd"
class_name HeartLibControllerOverhead

func _motion() -> void:
	set_motion_vector(lerp(get_motion_vector(),get_vector_inputs() * get_move_speed(), get_acceleration()))

func _test_movement() -> void:
	set_move_speed(50)
	set_acceleration(0.5)
	_motion()
