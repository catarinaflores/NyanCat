extends Node

var score = 0
var speed = 400
var gravity = 1000

#var cat_falling: bool = false

signal hit
signal scored


func game_ends():
	speed = 0
