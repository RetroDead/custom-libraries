extends Node
class_name GearLibTransition

"NOTE : Make 'GearLibTransitionScene' an autoload to use this script "

var _DEBUG_TRANS_COUNT : int = 0
var is_transitioning : bool = false
signal transition_finished

func change_scene(target_scene : String) -> void:
	var _transition_animation = $transition_animation
	
	if is_transitioning: return
	
	_DEBUG_TRANS_COUNT += 1
	
	is_transitioning = true
	_transition_animation.play("fade to black")
	
	yield(_transition_animation,"animation_finished")
	
	get_tree().change_scene(target_scene)
	emit_signal("transition_finished")
	
	_transition_animation.play("fade to clear")
	yield(_transition_animation,"animation_finished")
	is_transitioning = false

func fade_and_exit_program() -> void:
	var _transition_animation = $transition_animation
	_transition_animation.play("fade to black")
	yield(_transition_animation,"animation_finished")
	get_tree().quit()
