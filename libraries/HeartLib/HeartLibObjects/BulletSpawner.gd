extends Position2D
class_name HeartLibBulletSpawner

var _bullet_reference = preload("res://libraries/HeartLib/HeartLibObjects/Bullet.tscn")
var _bullet_speed : float
var _bullet_rotation_speed : float
var _bullet_rotation : float
var _bullet_acceleration : float
var _bullet_color : Color
var _bullet_spawn_offset : Vector2
var _bullet_lifetime : float 


func spawn_bullet() -> void:
	var b : HeartLibBullet = _bullet_reference.instance()
	
#	HeartLib.main.call_deferred("add_child",b)
	HeartLib.main.add_child(b)
	
	b.global_position = global_position + get_bullet_spawn_offset()
	
	b.set_rotation_degrees(get_bullet_rotation())
	b.set_bullet_speed(get_bullet_speed())
	b.set_acceleration(get_bullet_acceleration())
	b.set_rotation_speed(get_bullet_rotation_speed())
	b._expire_timer.set_wait_time(get_bullet_lifetime())

# -------- private

func get_bullet_reference() -> HeartLibBullet:
	return _bullet_reference

func set_bullet_reference(bullet_reference : HeartLibBullet) -> void:
	_bullet_reference = bullet_reference

func get_bullet_speed() -> float:
	return _bullet_speed

func set_bullet_speed(bullet_speed : float) -> void:
	_bullet_speed = bullet_speed

func get_bullet_rotation_speed() -> float:
	return _bullet_rotation_speed

func set_bullet_rotation_speed(bullet_rotation_speed : float) -> void:
	_bullet_rotation_speed = bullet_rotation_speed

func get_bullet_rotation() -> float:
	return _bullet_rotation

func set_bullet_rotation(bullet_rotation : float) -> void:
	_bullet_rotation = bullet_rotation

func get_bullet_acceleration() -> float:
	return _bullet_acceleration

func set_bullet_acceleration(bullet_acceleration : float) -> void:
	_bullet_acceleration = bullet_acceleration

func get_bullet_color() -> Color:
	return _bullet_color

func set_bullet_color(bullet_color : Color) -> void:
	_bullet_color = bullet_color

func get_bullet_spawn_offset() -> Vector2:
	return _bullet_spawn_offset

func set_bullet_spawn_offset(bullet_spawn_offset : Vector2) -> void:
	_bullet_spawn_offset = bullet_spawn_offset

func get_bullet_lifetime() -> float:
	return _bullet_lifetime

func set_bullet_lifetime(bullet_lifetime : float) -> void:
	_bullet_lifetime = bullet_lifetime
