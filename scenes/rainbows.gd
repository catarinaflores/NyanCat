extends Node2D

signal hit





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_top_rainbow_body_entered(body):
	hit.emit()



func _on_bottom_rainbow_body_entered(body):
	hit.emit()
