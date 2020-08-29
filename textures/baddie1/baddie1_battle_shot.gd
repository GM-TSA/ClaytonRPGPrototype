extends KinematicBody2D

const SPEED = 1000

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, SPEED*delta))
	if collision:
		print(collision.collider.name)
		if (collision.collider.name == "baddie1_player"):
			global.end_battle(false)
		else:
			get_parent().remove_child(self)
