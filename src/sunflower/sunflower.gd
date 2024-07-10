@tool
extends GridObject

func detect_player():
	var player = get_tree().get_first_node_in_group("player")
	if (tile == player.tile):
		Signals.level_won.emit()
