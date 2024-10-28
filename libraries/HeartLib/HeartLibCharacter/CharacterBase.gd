extends KinematicBody2D
class_name HeartLibCharacterBase

var _current_state : String = "_state_free"

const KNOCKBACK_RELEASE_TIME : float = 0.7

export var _move_speed : float
export var _acceleration : float

var _input_vector : Vector2
var _motion_vector : Vector2
var _knockback_time : float = 0.0

func _physics_process(delta: float) -> void:
	call_state()

func call_state() -> void:
	if has_method(_current_state):
		call(_current_state)
	move_and_slide(get_motion_vector(),Vector2.UP)

# -------- state
func _state_free():
	_test_movement()

func get_vector_inputs() -> Vector2:
	return Input.get_vector("key_left","key_right","key_up","key_down")

func _test_movement() -> void:
	pass

# -------- 
# TL;DR, keep node structure the same when using components so we can access them easier. wow
# A little lazy, but i dont want to over complicate this tbh, just needs to be fairly general purpose.

func get_health_component() -> HeartLibHealthComponent:
	var _hc : HeartLibHealthComponent = get_node("HealthComponent")
	return _hc

func get_team_component() -> HeartLibTeamComponent:
	var _tc : HeartLibTeamComponent = get_node("TeamComponent")
	return _tc

func get_destruction_component() -> HeartLibDestructionComponent:
	var _dc : HeartLibDestructionComponent = get_node("DestructionComponent")
	return _dc

# -------- private

func set_state(current_state : String) -> void:
	_current_state = current_state

func get_state() -> String:
	return _current_state

func set_move_speed(move_speed : float) -> void:
	_move_speed = move_speed

func get_move_speed() -> float:
	return _move_speed

func set_acceleration(acceleration : float) -> void:
	_acceleration = acceleration

func get_acceleration() -> float:
	return _acceleration

func set_motion_vector(motion_vector : Vector2) -> void:
	_motion_vector = motion_vector

func get_motion_vector() -> Vector2:
	return _motion_vector

func set_input_vector(input_vector : Vector2) -> void:
	_input_vector = input_vector

func get_input_vector() -> Vector2:
	return _input_vector

func get_knockback_time() -> float:
	return _knockback_time

func set_knockback_time(knockback_time : float) -> void:
	_knockback_time = knockback_time

func _knockback_release() -> void:
	_knockback_time += get_process_delta_time()
	if _knockback_time >= KNOCKBACK_RELEASE_TIME:
		_knockback_time = 0
		set_state("_state_free")

func apply_knockback(knockback_force : float) -> void:
	return
