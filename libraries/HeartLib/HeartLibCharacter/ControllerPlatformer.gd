extends "res://libraries/HeartLib/HeartLibCharacter/CharacterBase.gd"
class_name ControllerPlatformer

export var _gravity : float = 9.8
export var _jump_strength : float = 350

# -------- private

func _motion() -> void:
	set_motion_vector(Vector2(
		lerp(get_motion_vector().x,get_vector_inputs().x * get_move_speed(), get_acceleration()),
		get_motion_vector().y
	))

func _test_movement() -> void:
	set_move_speed(50)
	set_acceleration(0.5)
	set_input_vector(get_vector_inputs())
	_apply_gravity()
	_jump()
	_motion()


func _apply_gravity() -> void:
	if not is_on_floor():
		set_motion_vector(Vector2(get_motion_vector().x,get_motion_vector().y + get_gravity()))
	else:
		set_motion_vector(Vector2(get_motion_vector().x,0))

func _jump() -> void:
	if not is_on_floor(): return
	
	if Input.is_action_pressed("key_jump"):
		set_motion_vector(Vector2(get_motion_vector().x, - get_jump_strength()))

func get_jump_strength() -> float:
	return _jump_strength

func set_jump_strength(jump_strength) -> void:
	_jump_strength = jump_strength

func get_gravity() -> float:
	return _gravity

func set_gravity(gravity : float) -> void:
	_gravity = gravity
