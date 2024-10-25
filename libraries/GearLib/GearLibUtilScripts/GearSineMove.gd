extends Node2D

# doesnt need anything extra to work, very plug and play. just edit variables and what not.


export var preset = ""

# these settings give a gentle wave
export var freqX = 5
export var ampX = 100
export var freqY = 5
export var ampY = 200
export var freqA = 3
export var ampA = 250
export var rngRange = 100

var rngX = 0
var rngY = 0
var rngA = 0
var time = 0

var initX 
var initY
var initA

func _ready():
	if preset !="":
		assign_preset(preset)
	
	rngX = rand_range(-rngRange,rngRange)
	rngY = rand_range(-rngRange,rngRange)
	rngA = rand_range(-rngRange,rngRange)
	
	initX = position.x
	initY = position.y
	initA = rotation_degrees

func assign_preset(preset):
	match preset:
		"gentleWave":
			freqX = 5
			ampX = 100
			freqY = 5
			ampY = 200
			freqA = 3
			ampA = 250
			rngRange = 100
		
		"fast":
			freqX = 100
			ampX = 1000
			freqY = 100
			ampY = 1000
			freqA = 100
			ampA = 1000
			rngRange = 100
		
		"xmove":
			freqX = 10
			ampX = 1000
			freqY = 0
			ampY = 0
			freqA = 0
			ampA = 0
			rngRange = 0
		
		"ymove":
			freqX = 0
			ampX = 0
			freqY = 10
			ampY = 1000
			freqA = 0
			ampA = 0
			rngRange = 0
		
		"amove":
			freqX = 0
			ampX = 0
			freqY = 0
			ampY = 0
			freqA = 10
			ampA = 1000
			rngRange = 0

func _physics_process(delta):
	time += delta
	var movementX = cos(time*freqX+rngX)*ampX
	var movementY = cos(time*freqY+rngY)*ampY
	var movementA = cos(time*freqA+rngA)*ampA
	position.x =initX + movementX * delta
	position.y =initY + movementY * delta
	rotation_degrees = initA + movementA * delta
