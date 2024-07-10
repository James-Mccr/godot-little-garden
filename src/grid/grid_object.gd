extends Node2D
class_name GridObject

@export var tile = Vector2i.ZERO
const delta = 0.05
var moving = false

func _ready():
	move_tile(tile)

func is_tile_inbounds(new_tile):
	return get_parent().get_cell_tile_data(0, new_tile) != null

func tile_to_position(new_tile:Vector2i):
	return get_parent().map_to_local(new_tile)

func move_tile(new_tile:Vector2i):
	move(new_tile, get_parent().map_to_local(new_tile))

func just_move(new_tile:Vector2i):
	await move_base(new_tile, get_parent().map_to_local(new_tile))
	
func move_base(new_tile, new_pos):
	if moving:
		return
	moving = true
	tile = new_tile
	while not position.is_equal_approx(new_pos):
		position = position.move_toward(new_pos, 1)
		await get_tree().create_timer(delta).timeout
	position = new_pos
	moving = false

func move(new_tile, new_pos):
	if moving:
		return
	moving = true
	tile = new_tile
	while not position.is_equal_approx(new_pos):
		position = position.move_toward(new_pos, 1)
		await get_tree().create_timer(delta)	.timeout
	position = new_pos
	moving = false
