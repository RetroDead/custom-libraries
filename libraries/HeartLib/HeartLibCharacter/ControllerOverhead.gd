extends "res://libraries/HeartLib/HeartLibCharacter/CharacterBase.gd"
class_name HeartLibControllerOverhead

var _last_facing_direction : Vector2

func _motion() -> void:
	set_motion_vector(lerp(get_motion_vector(),get_vector_inputs() * get_move_speed(), get_acceleration()))

func _test_movement() -> void:
	_remember_last_facing_direction()
	_motion()
#	DEBUG_show_motion_vector()

func set_last_facing_direction(last_facing_direction : Vector2) -> void:
	_last_facing_direction = last_facing_direction

func _remember_last_facing_direction() -> void:
	if get_vector_inputs() != Vector2.ZERO:
		_last_facing_direction = get_vector_inputs()

func get_last_facing_direction() -> Vector2:
	return _last_facing_direction

const KNOCKBACK_FORCE : int = 500
func apply_knockback(knockback_force) -> void:
	set_state("_state_knockback")
	var _knockback_vector : Vector2 = Vector2(KNOCKBACK_FORCE,KNOCKBACK_FORCE) * get_last_facing_direction() * Vector2(-1,-1)
	set_motion_vector(_knockback_vector)

const KNOCKBACK_FORCE_RELEASE_THRESHOLD : int = 50
func _state_knockback() -> void:
#	DEBUG_show_knockback_vector()
	_knockback_release()
	set_motion_vector(
		lerp(get_motion_vector(),Vector2.ZERO,get_acceleration())
	)
	if abs(get_motion_vector().x + get_motion_vector().y) < KNOCKBACK_FORCE_RELEASE_THRESHOLD:
		set_state("_state_free")

#func DEBUG_show_motion_vector() -> void:
#	var _line : Line2D = $cur_vec
#	var _vec : Vector2 = Vector2(64,64) * get_vector_inputs()
#	_line.set_points([Vector2.ZERO,_vec])
#
#func DEBUG_show_knockback_vector() -> void:
#	var _line_prev : Line2D = $prev_vec
#	var _prev_vec : Vector2 = Vector2(64,64) * get_last_facing_direction() * Vector2(-1,-1)
#	_line_prev.set_points([Vector2.ZERO,_prev_vec])
