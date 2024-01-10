extends CanvasLayer

@onready var score_label = %ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label.text = GameManager.score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
