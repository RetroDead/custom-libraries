extends "res://libraries/HeartLib/HeartLibComponents/HeartAreaDetectionInterface.gd"
class_name HeartLibHurtbox


signal on_hurt(damage)

#export var _link_container : Resource = HeartLibLinkContainer.new()
#
#func get_link() -> Resource:
#	return _link_container

func _on_area_collision(area : Area2D) -> void:
	emit_signal("on_hurt",10)
	return

func _on_body_collision(body : PhysicsBody2D) -> void:
	return

func _on_body_exit(body : PhysicsBody2D) -> void:
	return

func _on_area_exit(area : Area2D) -> void:
	return
