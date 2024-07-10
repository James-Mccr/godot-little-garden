extends Node

var active = true

func game_turn():
	var children = get_parent().get_node("Map").get_children()
	for child in children:
		if (active and child.has_node("Turn")):
			child.get_node("Turn").turn()
