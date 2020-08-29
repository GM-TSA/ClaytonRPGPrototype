extends TileMap

onready var torch_light_scene = preload("res://textures/torch_light.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for cell_pos in get_used_cells():
		match tile_set.tile_get_name(get_cellv(cell_pos)):
			"Torch":
				var light_pos: Vector2
				match get_cell_autotile_coord(cell_pos.x, cell_pos.y):
					Vector2(0, 0):
						light_pos = Vector2(8, 14.5)
					Vector2(0, 1):
						light_pos = Vector2(14.5, 8)
					Vector2(1, 0):
						light_pos = Vector2(1.5, 8)
					Vector2(1, 1):
						light_pos = Vector2(8, 1.5)
				
				var torch_light = torch_light_scene.instance()
				torch_light.position = cell_pos*16+light_pos
				add_child(torch_light)
