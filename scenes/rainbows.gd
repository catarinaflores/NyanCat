extends Node2D

var speed = 0

func set_speed(new_speed):
	speed = new_speed

func _process(delta):
	position.x = speed * delta


func _on_top_rainbow_body_entered(body):
	GameManager.hit.emit()


func _on_bottom_rainbow_body_entered(body):
	GameManager.hit.emit()


func _on_scoring_area_body_entered(body):
	GameManager.scored.emit()
	GameManager.score += 1
