extends CharacterBody2D

@onready var animated_sprite_2d = %AnimatedSprite2D

@export var gravity = 1000
@export var fly_force = 300


const START_POS = Vector2(100, 500)

var max_speed = 400
var cat_rotation = 2

func _ready() -> void:
	reset()


func _physics_process(delta):
	if Input.is_action_just_pressed("fly"):
		fly()
	
	velocity.y += gravity + delta
	if velocity.y > max_speed:
		velocity.y = max_speed
	
	move_and_collide(velocity * delta)
	
	rotate_cat()


func reset() -> void:
	velocity = Vector2.ZERO
	position = START_POS
	set_rotation(0)


func fly() -> void:
	velocity.y = fly_force
	rotation = deg_to_rad(-30)
	animated_sprite_2d.play("cat")


func rotate_cat() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) > 90:
		rotation += cat_rotation * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= cat_rotation * deg_to_rad(1)
