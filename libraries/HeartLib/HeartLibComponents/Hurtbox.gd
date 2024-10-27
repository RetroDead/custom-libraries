extends "res://libraries/HeartLib/HeartLibComponents/HeartAreaDetectionInterface.gd"
class_name HeartLibHurtbox


signal on_hurt(damage)

#export var _link_container : Resource = HeartLibLinkContainer.new()
#
#func get_link() -> Resource:
#	return _link_container


func _on_area_collision(area : Area2D) -> void:
	_try_hit(area)
	return

func _on_body_collision(body : PhysicsBody2D) -> void:
	return

func _on_body_exit(body : PhysicsBody2D) -> void:
	return

func _on_area_exit(area : Area2D) -> void:
	return

func _try_hit(area : HeartLibAreaDetectionInterface) -> void:
	if not area.is_in_group("hitbox"): return
	
	var _my_team_comp : HeartLibTeamComponent = get_parent().get_team_component()
	var _hitbox_team_comp : HeartLibTeamComponent = area.get_node("TeamComponent")
	
	if not _my_team_comp.is_on_same_team(_hitbox_team_comp):
		get_parent().apply_knockback(10)

func _try_death() -> void:
	return
