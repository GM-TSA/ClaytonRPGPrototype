extends KinematicBody2D

var velocity = Vector2()

const GRAVITY = 5
const SPEED = 500

onready var sprite = $Sprite

func _physics_process(delta):
	velocity.y += GRAVITY
	
	var lr_move = 0
	if Input.is_action_pressed("left"):
		lr_move -= 1
	if Input.is_action_pressed("right"):
		lr_move += 1
	lr_move *= SPEED
	
	velocity.x = lr_move
	
	velocity = move_and_slide(velocity)
