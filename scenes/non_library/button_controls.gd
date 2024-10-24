extends Control

onready var button_restart = $"../button_restart"
onready var button_quit = $"../button_quit"

func _ready() -> void:
	button_quit.connect("pressed",self,"_quit_library_test")
	button_restart.connect("pressed",self,"_restart")

# --------

func _quit_library_test() -> void:
	get_tree().quit()

func _restart() -> void:
	get_tree().reload_current_scene()
