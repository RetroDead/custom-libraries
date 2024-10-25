extends Area2D
class_name Hurtbox


func _ready() -> void:
	connect("area_entered",self,"_on_area_collision")
	connect("body_entered",self,"_on_body_collision")
	connect("area_exited",self,"_on_area_exit")
	connect("body_exited",self,"_on_body_exit")

func _on_area_collision(area : Area2D) -> void:
	return

func _on_body_collision(body : PhysicsBody2D) -> void:
	return

func _on_body_exit(body : PhysicsBody2D) -> void:
	return

func _on_area_exit(area : Area2D) -> void:
	return
