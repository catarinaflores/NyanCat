extends Control

@onready var all_scores = %AllScores


func _process(delta):
	all_scores.text = "Your Score \n" + str(GameManager.score) + " \n " + "High Score \n" + str(SaveSystem.data.highscore)


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func _on_quit_button_pressed():
	get_tree().quit()
