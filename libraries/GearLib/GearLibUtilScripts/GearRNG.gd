extends Node
class_name GearLibRNG
const INITIAL_STATE : int = 0

var _rng : RandomNumberGenerator = RandomNumberGenerator.new()
var _rng_set : Array = [
	_rng
]

# -------- gameplay

# returns if the chance given succedes or not (0.0-1.0)
func rng_check_chance(chance : float = 0.0,rng_index : int = 0) -> bool:
	return _rng_get_float(rng_index) < chance

# returns a random number between a min value, and max value ( exlusive )
func rng_check_range(min_value : int = 0, max_value : int = 1,rng_index : int = 0) -> int:
	return _get_rng_object(rng_index).randi_range(min_value,max_value -1) # exclusive

# -------- manipulation

# allows for the use of multiple rng objects
func add_rng_object() -> int:
	var _rng = RandomNumberGenerator.new()
	_rng_set.append(_rng)
	return _rng_set.find(_rng)

# removes an rng object by its index
func remove_rng_object(rng_index : int = 0) -> void:
	if rng_index == 0: return # dont allow _rng to be deleted
	var _obj = _get_rng_object(rng_index)
	if _obj == null or not is_instance_valid(_obj): return # no object here
	_set_rng_null_set_by_index(rng_index)

# sets the seed to a new values
func set_seed(random_seed : int = 0,rng_index : int = 0) -> void:
	if not _does_rng_object_exist(rng_index): return
	_get_rng_object(rng_index).set_seed(random_seed)
	

# gets the seed
func get_seed(rng_index : int = 0) -> int:
	return _get_rng_object(rng_index).get_seed()

# resets the rng object to an initial state
func reset_rng_state() -> void:
	_rng.set_state(INITIAL_STATE)


# -------- private

# checks to see if the value at the rng_index exists, or is null
func _does_rng_object_exist(rng_index : int) -> bool:
	if rng_index == 0: return true
	if (_rng_set.size() - 1) < rng_index: return false
	
	var _obj = _rng_set[rng_index]
#	print(_rng_set)
#	print("obj = "+str(_obj))
	if _obj == null or not is_instance_valid(_obj): return false
	return true

# sets the value at rng_index to null
func _set_rng_null_set_by_index(rng_index : int) -> void:
	_rng_set[rng_index] = null

# gets an rng object by using its seed
func _get_rng_object(rng_index : int = 0) -> RandomNumberGenerator:
	return _rng_set[rng_index]

# gets a random float from the rng object
func _rng_get_float(rng_index : int = 0) -> float:
	return _get_rng_object(rng_index).randf()
