extends Node

var score = 0

var game_running: bool = true
var game_over: bool
var cat_falling: bool = false

signal hit
signal scored


func game_ends():
	get_tree().paused = true


func _on_hit():
	cat_falling = true
	game_ends()
	

func _on_scored():
	score += 1
