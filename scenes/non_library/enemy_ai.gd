extends "res://libraries/HeartLib/HeartLibObjects/BulletHellAiTemplate.gd"

onready var bullet_spawner : HeartLibBulletSpawner= $"../BulletSpawner"

func _attack() -> void:
	if _is_in_attack: return
	
	_is_in_attack = true
	
	var attack_times : int = 10
	var alt = -1
	var counter = 0
	
	for k in 5:
		yield(get_tree().create_timer(1,false),"timeout")
		for j in 10:
			yield(get_tree().create_timer(0.25,false),"timeout")
			for i in attack_times:
				bullet_spawner.set_bullet_lifetime(10)
				bullet_spawner.set_bullet_speed(0)
				bullet_spawner.set_bullet_acceleration(90+ (1 * counter) * alt)
				bullet_spawner.set_bullet_rotation((360/attack_times) * i + (5 * counter) * alt+(10 * k))
				bullet_spawner.spawn_bullet()
				alt *= -1
			counter += 1
	
	_is_in_attack = false
#	if _is_in_attack: return
#	var attack_times : int = 20
#	_is_in_attack = true
#	for j in 50:
#		yield(get_tree().create_timer(0.1,false),"timeout")
#		for i in attack_times:
#			bullet_spawner.set_bullet_speed(10)
#			bullet_spawner.set_bullet_acceleration(150)
#			if i % 3 == 0:
#				bullet_spawner.set_bullet_rotation((360/attack_times) * i + (10 * j))
#			else:
#				bullet_spawner.set_bullet_rotation((360/attack_times) * i + (10 * j) * -1)
#			bullet_spawner.spawn_bullet()
#
#	_is_in_attack = false
