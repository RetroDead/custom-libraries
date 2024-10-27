extends Node2D
class_name HeartLibBullet

export var _bullet_speed : float = 500
export var _rotation_speed : float 
export var _acceleration : float

onready var _expire_timer : Timer = $ExpireTimer
onready var _visibility : VisibilityNotifier2D = $Visibility

func _ready() -> void:
	_expire_timer.connect("timeout",self,"_destroy")
	_visibility.connect("screen_exited",self,"_destroy")

func _physics_process(delta) -> void:
	set_bullet_speed(get_bullet_speed() + get_acceleration() * delta)
	position += transform.x * get_bullet_speed() * delta
	rotation_degrees += get_rotation_speed() * delta

# -------- private

func _destroy() -> void:
	queue_free()

# --------

func get_expire_timer() -> Timer:
	return _expire_timer

func get_bullet_speed() -> float:
	return _bullet_speed

func set_bullet_speed(bullet_speed : float) -> void:
	_bullet_speed = bullet_speed

func get_rotation_speed() -> float:
	return _rotation_speed

func set_rotation_speed(rotation_speed : float) -> void:
	_rotation_speed = rotation_speed

func get_acceleration() -> float:
	return _acceleration

func set_acceleration(acceleration : float) -> void:
	_acceleration = acceleration
