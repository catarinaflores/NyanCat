extends CharacterBody2D

@onready var animated_sprite_2d = %AnimatedSprite2D

@export var gravity = 1000
@export var fly_force = -300


const START_POS = Vector2(200, 500)

var falling_speed = 400
var cat_rotation = 2

func _ready() -> void:
	reset()


func _physics_process(delta):
	top_collision()
	if GameManager.cat_falling == false:
		if Input.is_action_just_pressed("fly"):
			fly()
		
		velocity.y += gravity * delta
		if velocity.y > falling_speed:
			velocity.y = falling_speed
		
		move_and_collide(velocity * delta)
		
		rotate_cat()
	else:
		stop(delta)



func reset() -> void:
	velocity = Vector2.ZERO
	position = START_POS
	set_rotation(0)


func fly() -> void:
	velocity.y = fly_force
	rotation = deg_to_rad(-30)
	animated_sprite_2d.play("cat")


func rotate_cat() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += cat_rotation * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= cat_rotation * deg_to_rad(1)


func stop(delta) -> void:
	velocity.y += gravity * delta
	move_and_collide(velocity * delta)
	rotate_cat()
	set_process_input(false)


func top_collision() -> void:
	if self.position.y < 0:
		GameManager.cat_falling = true
		

