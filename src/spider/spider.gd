@tool
extends GridObject

const chase_range = 2
var target_tile = Vector2i.ZERO
var target_tile2 = Vector2i.ZERO
var adjacent_index = 0
var adjacent_tiles = [Vector2i.UP, Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT]

var shooting = false

func shoot_web():
	var player = get_tree().get_first_node_in_group("player")
	if player.tile == target_tile or player.tile == target_tile2:
		Signals.game_over.emit()
	shooting = false
	$WebCursor.hide()
	$WebCursor2.hide()

func detect_player():
	var player = get_tree().get_first_node_in_group("player")
	if Grid.is_near(player.tile, tile, chase_range):
		shooting = true
		target_tile = player.tile
		target_tile2 = target_tile + adjacent_tiles[adjacent_index]
		if adjacent_index == 3:
			adjacent_index = 0
		else:
			adjacent_index += 1
		$WebCursor.position = tile_to_position(target_tile) - position
		$WebCursor.show()
		if is_tile_inbounds(target_tile2):
			$WebCursor2.position = tile_to_position(target_tile2) - position
			$WebCursor2.show()
