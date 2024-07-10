@tool
extends GridObject

const cooldown_max = 3
var cooldown = 0

func attract():
	if cooldown == 0:
		var player = get_tree().get_first_node_in_group("player")
		if Grid.is_near(player.tile, tile, 1) or player.tile == tile:
			await player.just_move(tile)
			cooldown = cooldown_max
			$Sprite2D.texture = load("res://flowers/flowers-wither.png")
	else:
		cooldown -= 1
		if cooldown == 0:
			$Sprite2D.texture = load("res://flowers/flowers.png")
		
