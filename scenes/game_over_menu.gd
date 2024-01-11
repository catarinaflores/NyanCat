extends CanvasLayer

@onready var all_scores = %AllScores

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	all_scores.text = "Your Score \n" + str(GameManager.score) + " \n " + "High Score \n" + str(SaveSystem.data.highscore)



func _on_replay_button_pressed():
	get_tree().reload_current_scene()
