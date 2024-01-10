extends Node2D

var speed = 400

func _process(delta):
	position.x -= speed * delta


func _on_top_rainbow_body_entered(CharacterBody2D):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_bottom_rainbow_body_entered(CharacterBody2D):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_scoring_area_body_entered(CharacterBody2D):
	GameManager.scored.emit()
	
