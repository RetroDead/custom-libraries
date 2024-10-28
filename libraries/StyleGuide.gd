"""

Just a little document to help maintain consistency within the codebase
Just some rules I can try to follow when working on the Libraries

So these only apply for actually writing library code, though I will probably still follow them

======== NAMING VARIABLES

Generally, variables are named in snake_case, and strongly styped
so,
	var foo : type = value
	var foo_bar : type = type

Constants follow the traditional naming convention, being typed in CAPITALIZED_SNAKE_CASE
so,
	const MY_CONSTANT : type = value

Variable protection does not exist in Godot, but for the sake of consistensy, we can 
name our variables in such a way we can recognize when a variable is protected (i mean 'private' btw, not 'protected')

private variables are typed with a leading underscore. same for constants
so,
	var _my_private_foo : type = value
	const _MY_PRIVATE_CONST : type = value

In addition to this, since we are pretending our variables are actually private, we also use setters
and getters to use them. I actually only enforce this in the case of wanting extra functionallity
when changing a variable, but i suppose it is good practice anyways

HOWEVER - I dont like using Godot's built in setters / getters. I just make my own... Just preference.

so,
	var _my_private_foo : type = value
	
	
	func set_my_private_foo(my_private_foo : type) -> void:
		_my_private_foo = my_private_foo
	
	func get_my_private_foo() -> type:
		return _my_private_foo

Variables inside of methods also have a leading underscore. Again, this is only for Libraries.

======== NAMING METHODS

Naming methods generally follows the same rules for variables

Use snake_cake
Private methods use snake_case with a leading underscore
so,
	func _my_private_method(parameter : type) -> type:
		return type

Non private methods are as such
so,
	func my_public_method(parameter : type) -> type:
		return type 

========
"""
