extends KinematicBody2D

export (float) var speed = 3

onready var global = get_node("/root/global")

func _physics_process(delta):
	var velocity = Vector2(
		1 if Input.is_action_pressed('right') else -1 if Input.is_action_pressed('left') else 0,
		1 if Input.is_action_pressed('down') else -1 if Input.is_action_pressed('up') else 0
	)
	if velocity.length() != 0:
		rotation_degrees = (180 if velocity.y == 1 else 0) + (0 if velocity.x == 0 else 90 if velocity.y == 0 else 45)*velocity.x*(-1 if velocity.y == 1 else 1)
	move_and_slide(velocity.normalized()*speed*16)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.name == "baddie1_top_down"):
			global.start_battle(global.baddie1_battle, collision.collider)
