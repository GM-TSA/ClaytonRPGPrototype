extends Sprite

var SHOT = load("res://textures/baddie1/baddie1_battle_shot.tscn")

const MAP_WIDTH = 1280
const WIDTH = 36

const MIN_TIME = 0.4
const MAX_AID = 1.25

const TARGET_SHOTS = 50
const MAX_DIFFICULTY = 0.2

var shots = 0

var start = 0.5
var start_time = 0
var current_time = 0
var target = 1
var target_time: float = 2.0

func _process(delta):
	if (shots < TARGET_SHOTS ):
		current_time += delta
		while (current_time > target_time):
			var shot = SHOT.instance()
			shot.position.x = to_coord(target)
			shot.position.y = position.y
			get_parent().add_child(shot)
			shots += 1
			
			start_time = 0
			current_time -= target_time
			var min_time = (pow((1-shots/(TARGET_SHOTS-1))*sqrt(1-MAX_DIFFICULTY), 2)+MAX_DIFFICULTY)*MIN_TIME
			target_time = rand_range(min_time, min_time*MAX_AID)
			start = target
			target = rand_range(0, 1)
		position.x = to_coord(lerp(start, target, current_time/target_time))
	else:
		global.end_battle(true)
	
func to_coord(value) -> float:
	return WIDTH/2+(MAP_WIDTH-WIDTH)*clamp(value, 0, 1)
