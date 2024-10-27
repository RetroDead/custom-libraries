extends Node

var _timer : Timer = Timer.new()
onready var bullet_spawner : HeartLibBulletSpawner= $"../BulletSpawner"

func _ready() -> void:
	add_child(_timer)
	_timer.connect("timeout",self,"_attack")
	_timer.one_shot = false
	_timer.start(10)
	yield(VisualServer,"frame_post_draw")
	_timer.emit_signal("timeout")
#	_attack()

func _attack() -> void:
	var attack_times : int = 10
	var alt = -1
	var counter = 0
	for k in 5:
		yield(get_tree().create_timer(1,false),"timeout")
		for j in 10:
			yield(get_tree().create_timer(0.1,false),"timeout")
			for i in attack_times:
	#			yield(get_tree().create_timer(0.05,false),"timeout")
				bullet_spawner.set_bullet_lifetime(10)
				bullet_spawner.set_bullet_speed(0)
				bullet_spawner.set_bullet_acceleration(150 + (1 * counter) * alt)
				bullet_spawner.set_bullet_rotation((360/attack_times) * i + (5 * counter) * alt+(10 * k))
				bullet_spawner.spawn_bullet()
				alt *= -1
			counter += 1
