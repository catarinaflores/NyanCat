extends Node

var score = 0
var gravity = 1000
var game_over: bool = false

#var cat_falling: bool = false

signal hit
signal scored


func game_ends():
	game_over = true
