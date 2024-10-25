extends Camera2D

# camera shake :3

onready var player = $"."

var camera_position : Vector2
var camera_offset : Vector2
var rand_shake_strength : float = 30
var shake_decay : float = 5
var shake_strength : float = 0

func shake(value):
	shake_strength = value

func _process(delta):
	shake_strength = lerp(shake_strength,0,shake_decay * delta)
	
	offset = get_camera_offset()

func get_camera_offset():
	return Vector2(
		rand_range(-shake_strength,shake_strength),
		rand_range(-shake_strength,shake_strength)
	)
