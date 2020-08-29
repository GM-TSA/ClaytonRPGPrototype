extends Node

onready var root = get_tree().get_root()

var lose_scene = load("res://scenes/lose_scene.tscn")
var level1 = load("res://scenes/Level1.tscn")
var baddie1_battle = load("res://textures/baddie1/baddie1_battle.tscn")

var saved_world: Node
var battle_enemy: Node

func get_current_scene() -> Node:
	return root.get_child(root.get_child_count()-1)

func start_battle(battle: Node, enemy: Node):
	saved_world = get_current_scene()
	battle_enemy = enemy
	root.remove_child(saved_world)
	root.add_child(baddie1_battle.instance())

func end_battle(win: bool):
	root.remove_child(get_current_scene())
	if (win):
		root.add_child(saved_world)
		battle_enemy.get_parent().remove_child(battle_enemy)
	else:
		root.add_child(lose_scene.instance())
