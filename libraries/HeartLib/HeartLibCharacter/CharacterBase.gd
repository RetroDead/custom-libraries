extends KinematicBody2D
class_name CharacterBase

var _current_state : String = "_state_free"

export var _move_speed : float
export var _acceleration : float
export var _input_vector : Vector2
export var _motion_vector : Vector2

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
