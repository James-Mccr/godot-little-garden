extends GridObject

var base_modulate

func _ready():
	base_modulate = $Sprite2D.modulate

func move(new_tile, new_pos):
	var player = get_tree().get_first_node_in_group("player")
	if Grid.is_near(new_tile, player.tile, 1):
		$Sprite2D.modulate = base_modulate
	else:
		$Sprite2D.modulate.a = 0.45
	tile = new_tile
	position = new_pos
