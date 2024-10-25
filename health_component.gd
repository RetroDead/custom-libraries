extends Node2D
class_name HealthComponent

export var _health : float
export var _health_max : float

signal health_at_max
signal health_at_zero

func take_damage(damage : float) -> void:
	set_health(clamp(_health - damage,0,_health_max))
	check_health()

func add_health(heal : float) -> void:
	set_health(clamp(_health + heal,0,_health_max))
	check_health()

func check_health() -> void:
	if get_health() <= 0.0:
		emit_signal("health_at_zero")
	
	if get_health() >= get_health_max():
		emit_signal("health_at_max")

func set_health(health : float) -> void:
	_health = health

func get_health() -> float:
	return _health

func set_health_max(health_max) -> void:
	_health_max = health_max

func get_health_max() -> float:
	return _health_max
