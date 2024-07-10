extends TileMap
class_name Grid

signal move_cursor(tile:Vector2i, position:Vector2)
signal m1_tile(tile:Vector2i, position:Vector2)
signal m2_tile(tile:Vector2i, position:Vector2)

func _ready():
	connect("move_cursor", $TileCursor.move)
	connect("m1_tile", $Bee.move)

func _physics_process(_delta):
	var mouse_position = get_local_mouse_position()
	var tile = local_to_map(mouse_position)
	if (get_cell_tile_data(0, tile) != null):
		var local_coords = map_to_local(tile)
		move_cursor.emit(tile, local_coords)
		if Input.is_action_just_pressed("left_click"):
			m1_tile.emit(tile, local_coords)
		elif Input.is_action_just_pressed("right_click"):
			m2_tile.emit(tile, local_coords)
	
static func is_near(tile:Vector2i, tile2:Vector2i, radius:int):
	return abs(tile.x - tile2.x) + abs(tile.y - tile2.y) <= radius
