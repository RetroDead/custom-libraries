extends "res://libraries/HeartLib/HeartLibCharacter/CharacterBase.gd"
class_name HeartLibControllerPlatformer

export var _air_acceleration : float 
export var _gravity : float = 9.8
export var _jump_strength : float = 350
var _last_facing_direction : int = 1.0

var _coyote_time : float = 0
const COYOTE_TIME_CHECK : float = 0.2


# -------- private
func _motion() -> void:
	var _active_accel : float
	
	if not is_on_floor():
		_active_accel = get_air_acceleration()
	else:
		_active_accel = get_acceleration()
	
	set_motion_vector(Vector2(
		lerp(get_motion_vector().x,get_vector_inputs().x * get_move_speed(),_active_accel ),
		get_motion_vector().y
	))

func _test_movement() -> void:
	set_input_vector(get_vector_inputs())
	_remember_last_facing_direction()
	_apply_gravity()
	_increment_coyote_time()
	_jump()
	_variable_jump_height()
	_motion()

# pretty insane / stupid to write two methods with the same signature and basically the same name lol
func set_last_facing_direction(last_facing_direction : float) -> void:
	_last_facing_direction = last_facing_direction

func _remember_last_facing_direction() -> void:
	if get_vector_inputs().x != 0:
		_last_facing_direction = get_vector_inputs().x

func get_last_facing_direction() -> int:
	return _last_facing_direction

func _apply_gravity() -> void:
	if not is_on_floor():
		set_motion_vector(Vector2(get_motion_vector().x,get_motion_vector().y + get_gravity()))
	else:
		set_motion_vector(Vector2(get_motion_vector().x,0))

func _increment_coyote_time() -> void:
	if not is_on_floor():
		_coyote_time += get_physics_process_delta_time()
		return
	_coyote_time = 0

func _jump() -> void:
	DEBUG_spawn_bullet()
	if Input.is_action_pressed("key_jump"):
		if (get_coyote_time() <= COYOTE_TIME_CHECK) or (is_on_floor()):
			set_coyote_time(COYOTE_TIME_CHECK + 1.0) # lol
			set_motion_vector(Vector2(get_motion_vector().x, - get_jump_strength()))

func _variable_jump_height() -> void:
	if Input.is_action_just_released("key_jump") and get_motion_vector().y < 0:
		set_motion_vector(Vector2(get_motion_vector().x,get_motion_vector().y / 3))

# shfits the player off the ground so they dont immedietly leave _state_knockback
const KNOCKBACK_VERTICAL_SHIFT : int = -3
const KNOCKBACK_FORCE_VERTICAL : int = -150
const KNOCKBACK_FORCE_HORIZONTAL : int = 100
func apply_knockback(knockback_force) -> void:
	set_state("_state_knockback")
	set_global_position(get_global_position() + Vector2(0,KNOCKBACK_VERTICAL_SHIFT))
	set_motion_vector(Vector2(
		KNOCKBACK_FORCE_HORIZONTAL * get_last_facing_direction() * -1,
		KNOCKBACK_FORCE_VERTICAL
	))

func get_coyote_time() -> float:
	return _coyote_time

func set_coyote_time(coyote_time) -> void:
	_coyote_time = coyote_time

func get_jump_strength() -> float:
	return _jump_strength

func set_jump_strength(jump_strength) -> void:
	_jump_strength = jump_strength

func get_gravity() -> float:
	return _gravity

func set_gravity(gravity : float) -> void:
	_gravity = gravity

func set_air_acceleration(air_acceleration : float) -> void:
	_air_acceleration = air_acceleration

func get_air_acceleration() -> float:
	return _air_acceleration

func _state_knockback():
	_knockback_release()
	_apply_gravity()
	set_motion_vector(Vector2(
		lerp(get_motion_vector().x,get_motion_vector().x, get_acceleration()),
		get_motion_vector().y
	))
	
		
	if is_on_floor():
		_knockback_time = 0
		set_state("_state_free")

func DEBUG_spawn_bullet() -> void:
	var b = load("res://libraries/HeartLib/HeartLibObjects/Bullet.tscn").instance()
	get_parent().add_child(b)
	b.global_position = global_position

#func _process(delta):
#	var m1 = get_motion_vector()
#	yield(VisualServer,"frame_post_draw")
#	yield(VisualServer,"frame_post_draw")
#	var m2 = get_motion_vector()
#
#	if m1 != m2:
#		print(m2)
